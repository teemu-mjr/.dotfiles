import QtQuick
import QtQuick.Layouts

Text {
    id: clock

    color: Theme.colCyan
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    font.bold: true
    Layout.rightMargin: Theme.rightMargin

    function update() {
        clock.text = Qt.formatDateTime(new Date(), "yyyy-MM-dd HH:mm:ss")
    }

    Component.onCompleted: clock.update()

    Connections {
        target: TimerService

        function onTick5s() {
            clock.update()
        }
    }
}
