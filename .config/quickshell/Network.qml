import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Networking

Row {
    id: root

    spacing: 8
    Layout.rightMargin: Theme.rightMargin

    property var device: null
    property var network: null
    property string ipAddress: ""

    Repeater {
        model: Networking.devices

        delegate: Item {
            required property var modelData

            Component.onCompleted: {
                if (modelData.connected) {
                    root.device = modelData
                }
            }

            Repeater {
                model: modelData.networks

                delegate: Item {
                    required property var modelData

                    Component.onCompleted: {
                        if (modelData.connected) {
                            root.network = modelData
                        }
                    }
                }
            }
        }
    }

    Process {
        command: root.device
        ? ["ip", "-4", "-o", "addr", "show", "dev", root.device.name, "scope", "global"]
        : []

        running: root.device !== null

        stdout: StdioCollector {
            onStreamFinished: {
                const match = this.text.match(/\binet\s+([0-9.]+)\//)

                root.ipAddress = match ? match[1] : ""
            }
        }
    }

    Text {
        // id: networkText

        color: Theme.colYellow
        font.pixelSize: Theme.fontSize
        font.family: Theme.fontFamily
        font.bold: true

        text: {
            if (!root.device) {
                return "󰤮 Offline"
            }

            if (root.network) {
                return `󰤨 ${root.network.name} ${Math.round(root.network.signalStrength * 100)}%`
            }

            return `󰈀 ${root.ipAddress}`
        }
    }

    // HoverHandler {
    //     id: hoverHandler
    // }
    //
    // Rectangle {
    //     visible: hoverHandler.hovered && root.ipAddress !== ""
    //
    //     anchors.top: networkText.bottom
    //     anchors.right: networkText.right
    //     anchors.topMargin: 6
    //
    //     width: ipText.implicitWidth + 16
    //     height: ipText.implicitHeight + 10
    //
    //     color: Theme.colBackground
    //     border.color: Theme.colCyan
    //     border.width: 1
    //     radius: 4
    //
    //     Text {
    //         id: ipText
    //
    //         anchors.centerIn: parent
    //
    //         text: root.ipAddress
    //
    //         color: Theme.colForeground
    //         font.pixelSize: Theme.fontSize
    //         font.family: Theme.fontFamily
    //     }
    // }
}
