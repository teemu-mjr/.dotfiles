import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Row {
    spacing: 8
    Layout.rightMargin: Theme.rightMargin

    Repeater {
        model: Hyprland.workspaces

        Text {
            required property var modelData

            visible: modelData.active || modelData.toplevels.length > 0

            text: modelData.name

            color: modelData.active
                ? Theme.colCyan
                : Theme.colFg

            font.pixelSize: Theme.fontSize
            font.family: Theme.fontFamily
            font.bold: modelData.active
        }
    }
}
