import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Text {
    color: Theme.colCyan
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    font.bold: true
    Layout.rightMargin: Theme.rightMargin

    property real memUsed: 0
    property real memTotal: 0

    function toGiB(bytes) {
        return bytes / (1024 * 1024 * 1024)
    }

    text: {
        if (memTotal <= 0) {
            return "RAM:?"
        }

        return toGiB(memUsed).toFixed(2) +
            "/" +
            toGiB(memTotal).toFixed(2) +
            " GiB"
    }

    FileView {
        id: memFile

        path: "/proc/meminfo"

        onLoaded: {
            const contents = text()

            const totalMatch = contents.match(/^MemTotal:\s+(\d+)\s+kB$/m)
            const availableMatch = contents.match(/^MemAvailable:\s+(\d+)\s+kB$/m)

            if (!totalMatch || !availableMatch) {
                return
            }

            memTotal = parseInt(totalMatch[1]) * 1024

            const available = parseInt(availableMatch[1]) * 1024
            memUsed = memTotal - available
        }
    }

    Connections {
        target: TimerService

        function onTick5s() {
            memFile.reload()
        }
    }

    Component.onCompleted: {
        memFile.reload()
    }
}
