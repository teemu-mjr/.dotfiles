import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Text {
    property int cpuUsage: 0
    property int lastCpuTotal: 0
    property int lastCpuIdle: 0

    text: "CPU: " + cpuUsage + "%"

    color: Theme.colYellow
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    font.bold: true
    Layout.rightMargin: Theme.rightMargin

    FileView {
        id: cpuFile

        path: "/proc/stat"

        onLoaded: {
            const line = text().split("\n")[0]
            const parts = line.trim().split(/\s+/)

            const user = parseInt(parts[1]) || 0
            const nice = parseInt(parts[2]) || 0
            const system = parseInt(parts[3]) || 0
            const idle = parseInt(parts[4]) || 0
            const iowait = parseInt(parts[5]) || 0
            const irq = parseInt(parts[6]) || 0
            const softirq = parseInt(parts[7]) || 0

            const total = user + nice + system + idle + iowait + irq + softirq
            const idleTime = idle + iowait

            if (lastCpuTotal > 0) {
                const totalDiff = total - lastCpuTotal
                const idleDiff = idleTime - lastCpuIdle

                if (totalDiff > 0) {
                    cpuUsage = Math.round(
                        100 * (totalDiff - idleDiff) / totalDiff
                    )
                }
            }

            lastCpuTotal = total
            lastCpuIdle = idleTime
        }
    }

    Connections {
        target: TimerService

        function onTick1s() {
            cpuFile.reload()
        }
    }

    Component.onCompleted: {
        cpuFile.reload()
    }
}
