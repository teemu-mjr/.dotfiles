import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Text {
    property int diskUsage: 0

    text: "Disk: " + diskUsage + "%"

    color: Theme.colBlue
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    font.bold: true
    Layout.rightMargin: Theme.rightMargin

    Process {
        id: diskProc

        command: ["df", "-P", "/"]

        stdout: SplitParser {
            onRead: data => {
                if (!data) {
                    return
                }

                const parts = data.trim().split(/\s+/)
                const percent = parts[4] || "0%"

                diskUsage = parseInt(percent.replace("%", "")) || 0
            }
        }

        Component.onCompleted: {
            running = true
        }
    }

    Connections {
        target: TimerService

        function onTick60s() {
            diskProc.running = true
        }
    }
}
