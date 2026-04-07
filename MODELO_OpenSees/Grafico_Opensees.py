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
# NODOS
# -------------------------
zero_prefixes = ("50", "60", "90", "100", "110", "120", "150", "160")

normal_x, normal_y, normal_z = [], [], []
zero_x, zero_y, zero_z = [], [], []

for n, (x, y, z) in nodes.items():
    s = str(n)

    if s.startswith(zero_prefixes):
        zero_x.append(x)
        zero_y.append(y)
        zero_z.append(z)
    else:
        normal_x.append(x)
        normal_y.append(y)
        normal_z.append(z)

# nodos normales
ax.scatter(normal_x, normal_y, normal_z, s=4)

# nodos zeroLength destacados
ax.scatter(
    zero_x,
    zero_y,
    zero_z,
    s=80,
    color="purple",
    marker="x",
    linewidths=2
)

# -------------------------
# FUNCIONES AUXILIARES
# -------------------------
def same_prefix(n1, n2, prefix):
    return str(n1).startswith(prefix) and str(n2).startswith(prefix)

def pair_prefix(n1, n2, p1, p2):
    return str(n1).startswith(p1) and str(n2).startswith(p2)

# -------------------------
# LINE
# -------------------------
for n1, n2 in lines:
    if n1 not in nodes or n2 not in nodes:
        continue

    x1, y1, z1 = nodes[n1]
    x2, y2, z2 = nodes[n2]

    color = "skyblue"

    # VERDES
    if any(same_prefix(n1, n2, p) for p in ["410", "440", "450", "480"]):
        color = "green"

    # AZULES
    elif any(same_prefix(n1, n2, p) for p in ["420", "430", "460", "470"]):
        color = "blue"

    # AMARILLOS
    elif any([
        pair_prefix(n1, n2, "10", "50"),
        pair_prefix(n1, n2, "420", "50"),
        pair_prefix(n1, n2, "430", "110"),
        pair_prefix(n1, n2, "110", "170"),
        pair_prefix(n1, n2, "40", "100"),
        pair_prefix(n1, n2, "100", "460"),
        pair_prefix(n1, n2, "160", "200"),
        pair_prefix(n1, n2, "160", "470"),
    ]):
        color = "yellow"

    # ROJOS CLÁSICOS
    elif any([
        pair_prefix(n1, n2, "410", "420"),
        pair_prefix(n1, n2, "420", "430"),
        pair_prefix(n1, n2, "430", "440"),
        pair_prefix(n1, n2, "450", "460"),
        pair_prefix(n1, n2, "460", "470"),
        pair_prefix(n1, n2, "470", "480"),
    ]):
        color = "red"

    ax.plot([x1, x2], [y1, y2], [z1, z2], color=color, linewidth=1.5)

# -------------------------
# PANEL (RELLENO GRIS)
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
plt.title("Modelo OpenSees coloreado avanzado")
plt.tight_layout()
plt.show()