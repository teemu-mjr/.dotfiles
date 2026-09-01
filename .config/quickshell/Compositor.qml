readonly property string desktop:
    Quickshell.env("XDG_CURRENT_DESKTOP") ?? ""

readonly property bool isSway:
    Quickshell.env("SWAYSOCK") !== "" ||
    desktop.toLowerCase().includes("sway")

readonly property bool isHyprland:
    Quickshell.env("HYPRLAND_INSTANCE_SIGNATURE") !== "" ||
    desktop.toLowerCase().includes("hyprland")
