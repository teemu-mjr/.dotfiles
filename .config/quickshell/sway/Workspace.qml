import QtQuick
import QtQuick.Layouts
import Quickshell.I3

Row {
    spacing: 8
    Layout.rightMargin: Theme.rightMargin

    Repeater {
        model: I3.workspaces

        Text {
            required property var modelData

            visible: modelData.focused || modelData.toplevels.length > 0

            text: modelData.name

            color: modelData.focused
                ? Theme.colCyan
                : Theme.colFg

            font.pixelSize: Theme.fontSize
            font.family: Theme.fontFamily
            font.bold: modelData.focused
        }
    }
}
