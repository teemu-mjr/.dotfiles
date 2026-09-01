import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire

Row {
    id: root
    spacing: 8

    Layout.rightMargin: Theme.rightMargin

    property var sink: Pipewire.defaultAudioSink
    property var source: Pipewire.defaultAudioSource

    PwObjectTracker {
        objects: [
            root.sink,
            root.source
        ]
    }

    Text {
        color: Theme.colPurple
        font.pixelSize: Theme.fontSize
        font.family: Theme.fontFamily
        font.bold: true

        text: {
            if (!root.sink || !root.sink.audio) {
                return "󰖁 ?"
            }

            if (root.sink.audio.muted) {
                return "󰖁"
            }

            return `󰕾 ${Math.round(root.sink.audio.volume * 100)}%`
        }
    }

    Text {
        color: Theme.colPurple
        font.pixelSize: Theme.fontSize
        font.family: Theme.fontFamily
        font.bold: true

        text: {
            if (!root.source || !root.source.audio) {
                return "󰍬 ?"
            }

            if (root.source.audio.muted) {
                return "󰍭"
            }

            return `󰍬 ${Math.round(root.source.audio.volume * 100)}%`
        }
    }
}
