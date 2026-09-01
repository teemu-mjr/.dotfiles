import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland

Text {
    text: ToplevelManager.activeToplevel
        ? ToplevelManager.activeToplevel.title
        : ""

    color: Theme.colPurple
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    font.bold: true
    Layout.fillWidth: true
    Layout.leftMargin: 6
    elide: Text.ElideRight
    maximumLineCount: 1
}
