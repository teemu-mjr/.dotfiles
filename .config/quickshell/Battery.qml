import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

Text {
    color: Theme.colYellow
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    font.bold: true
    Layout.rightMargin: Theme.rightMargin

    function formatTime(seconds) {
        const totalMinutes = Math.max(0, Math.round(seconds / 60))
        const hours = Math.floor(totalMinutes / 60)
        const minutes = totalMinutes % 60

        return `${hours.toString().padStart(2, "0")}:${minutes.toString().padStart(2, "0")}`
    }

    text: {
        if (!UPower.displayDevice.ready) {
            return "?%"
        }

        const percentage = Math.round(UPower.displayDevice.percentage * 100)

        if (UPower.displayDevice.state === UPowerDeviceState.Charging) {
            return `${percentage}% ${formatTime(UPower.displayDevice.timeToFull)}`
        }

        if (UPower.displayDevice.state === UPowerDeviceState.Discharging) {
            return `${percentage}% ${formatTime(UPower.displayDevice.timeToEmpty)}`
        }

        if (UPower.displayDevice.state === UPowerDeviceState.FullyCharged) {
            return `${percentage}%`
        }

        return `${percentage}%`
    }
}
