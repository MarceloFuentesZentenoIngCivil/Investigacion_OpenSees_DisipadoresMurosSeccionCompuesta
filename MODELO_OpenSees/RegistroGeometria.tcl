set fileNodos [open "nodos.txt" "w"]

foreach nodeTag [getNodeTags] {
    set coord [nodeCoord $nodeTag]
    puts $fileNodos "$nodeTag [lindex $coord 0] [lindex $coord 1] [lindex $coord 2]"
}

close $fileNodos


# EXPORTAR NODOS
set fileNodos [open "nodos.txt" "w"]

foreach nodeTag [getNodeTags] {
    set coord [nodeCoord $nodeTag]
    puts $fileNodos "$nodeTag [lindex $coord 0] [lindex $coord 1] [lindex $coord 2]"
}

close $fileNodos

# EXPORTAR ELEMENTOS
set fileEle [open "elementos.txt" "w"]

foreach eleTag [getEleTags] {
    set nodes [eleNodes $eleTag]

    if {[llength $nodes] == 2} {
        puts $fileEle "LINE [lindex $nodes 0] [lindex $nodes 1]"
    }

    if {[llength $nodes] == 4} {
        puts $fileEle "PANEL [lindex $nodes 0] [lindex $nodes 1] [lindex $nodes 2] [lindex $nodes 3]"
    }
}

close $fileEle