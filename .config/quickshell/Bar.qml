import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    required property Component workspaces

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

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Item { width: 4 }

        Loader {
            sourceComponent: workspaces
        }

        Item { width: 4 }

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
