import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection

# -------------------------
# RUTA DE ARCHIVOS
# -------------------------
ruta = r"C:\Users\mfuentes\Desktop\OpenSees3.7.1\bin"

archivo_nodos = ruta + r"\nodos.txt"
archivo_elementos = ruta + r"\elementos.txt"

# -------------------------
# LEER NODOS
# -------------------------
nodes = {}

with open(archivo_nodos, "r") as f:
    for line in f:
        parts = line.split()
        if len(parts) < 4:
            continue
        tag = int(parts[0])
        x, y, z = map(float, parts[1:])
        nodes[tag] = (x, y, z)

print(f"Nodos leídos: {len(nodes)}")

# -------------------------
# LEER ELEMENTOS
# -------------------------
lines = []
panels = []

with open(archivo_elementos, "r") as f:
    for line in f:
        parts = line.split()
        if not parts:
            continue

        if parts[0] == "LINE":
            lines.append((int(parts[1]), int(parts[2])))

        elif parts[0] == "PANEL":
            panels.append(list(map(int, parts[1:5])))

# -------------------------
# GRAFICAR
# -------------------------
fig = plt.figure(figsize=(12, 9))
ax = fig.add_subplot(111, projection='3d')

# -------------------------
# NODOS NORMALES + PESO SÍSMICO
# -------------------------
normal_x, normal_y, normal_z = [], [], []
mass_x, mass_y, mass_z = [], [], []

for n, (x, y, z) in nodes.items():
    s = str(n)

    found = False
    for M in list(range(1, 21)) + list(range(41, 49)):
        for i in range(2, 35, 2):
            target = f"{M}0{i}"
            if s == target:
                mass_x.append(x)
                mass_y.append(y)
                mass_z.append(z)
                found = True
                break
        if found:
            break

    if not found:
        normal_x.append(x)
        normal_y.append(y)
        normal_z.append(z)

# nodos normales
ax.scatter(normal_x, normal_y, normal_z, s=0.3, color="black")

# nodos masa sísmica (mismo tamaño)
ax.scatter(
    mass_x,
    mass_y,
    mass_z,
    s=4,
    color="red"
)

# -------------------------
# VECTORES DE PESO
# -------------------------
L = 2.8   # mitad del entrepiso = 1.625 m

for x, y, z in zip(mass_x, mass_y, mass_z):
    ax.quiver(
        x, y, z + L,
        0, 0, -L,
        color="red",
        linewidth=1.5,
        arrow_length_ratio=0.45
    )

# -------------------------
# FUNCIONES AUXILIARES
# -------------------------
def same_prefix(n1, n2, prefix):
    return str(n1).startswith(prefix) and str(n2).startswith(prefix)

# -------------------------
# LINE
# -------------------------
column_prefixes = ["410", "420", "430", "440", "450", "460", "470", "480"]

for n1, n2 in lines:
    if n1 not in nodes or n2 not in nodes:
        continue

    x1, y1, z1 = nodes[n1]
    x2, y2, z2 = nodes[n2]

    # columnas negras
    if any(same_prefix(n1, n2, p) for p in column_prefixes):
        color = "black"
    else:
        # resto azul
        color = "blue"

    ax.plot([x1, x2], [y1, y2], [z1, z2], color=color, linewidth=1.2)

# -------------------------
# PANEL
# -------------------------
for panel in panels:
    X, Y, Z, J = panel

    pts = [
        nodes[X],
        nodes[Y],
        nodes[J],
        nodes[Z]
    ]

    poly = Poly3DCollection([pts])
    poly.set_edgecolor("black")
    poly.set_facecolor((0.7, 0.7, 0.7, 0.6))
    poly.set_linewidth(1)

    ax.add_collection3d(poly)

# -------------------------
# AJUSTES
# -------------------------
ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_zlabel("Z")
plt.title("Ubicación del peso sísmico en el modelo")
plt.tight_layout()
plt.show()