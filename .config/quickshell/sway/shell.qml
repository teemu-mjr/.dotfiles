import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

ShellRoot {
    // Current layout (sway: splith, splitv, tabbed, stacking)
    // Process {
    //     id: layoutProc
    //     command: ["sh", "-c", "swaymsg -t get_tree | jq -r '.. | select(.focused? == true) | .layout // empty' | head -1"]
    //     stdout: SplitParser {
    //         onRead: data => {
    //             if (data && data.trim()) {
    //                 var layout = data.trim()
    //                 // Convert sway layout names to friendly names
    //                 if (layout === "splith") {
    //                     currentLayout = "Horizontal"
    //                 } else if (layout === "splitv") {
    //                     currentLayout = "Vertical"
    //                 } else if (layout === "tabbed") {
    //                     currentLayout = "Tabbed"
    //                 } else if (layout === "stacking") {
    //                     currentLayout = "Stacking"
    //                 } else if (layout === "output" || layout === "none") {
    //                     currentLayout = "Tiled"
    //                 } else {
    //                     currentLayout = layout.charAt(0).toUpperCase() + layout.slice(1)
    //                 }
    //             }
    //         }
    //     }
    //     Component.onCompleted: running = true
    // }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30
            color: Theme.colBg

            margins {
                top: 0
                bottom: 0
                left: 0
                right: 0
            }

            Rectangle {
                anchors.fill: parent
                color: Theme.colBg

                RowLayout {
                    anchors.fill: parent
                    spacing: 0

                    Item { width: 4 }

                    Workspace { }

                    // Text {
                    //     text: currentLayout
                    //     color: Theme.colFg
                    //     font.pixelSize: Theme.fontSize
                    //     font.family: Theme.fontFamily
                    //     font.bold: true
                    //     Layout.leftMargin: 5
                    //     Layout.rightMargin: 5
                    // }

                    Divider {}

                    ActiveWindow {}

                    Network {}
                    Divider {}
                    Battery {}
                    Divider {}
                    Disk {}
                    Divider {}
                    CPU {}
                    Divider {}
                    RAM {}
                    Divider {}
                    Audio {}
                    Divider {}
                    Clock {}

                    Item { width: 4 }
                }
            }
        }
    }
}
