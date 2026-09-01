pragma Singleton

import QtQuick
import Quickshell

Singleton {
    signal tick1s()
    signal tick5s()
    signal tick60s()

    Timer {
        interval: 1000
        repeat: true
        running: true

        onTriggered: tick1s()
    }

    Timer {
        interval: 5000 - (Date.now() % 5000)
        repeat: true
        running: true

        onTriggered: {
            tick5s()
            interval = 5000
        }
    }

    Timer {
        interval: 60000 - (Date.now() % 60000)
        repeat: true
        running: true

        onTriggered: {
            tick60s()
            interval = 60000
        }
    }
}
