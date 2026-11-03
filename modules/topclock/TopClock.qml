import QtQuick
import Quickshell
import Quickshell.Wayland
import Caelestia.Config
import qs.components
import qs.services

Variants {
    model: Quickshell.screens

    PanelWindow {
        required property var modelData

        screen: modelData
        anchors {
            top: true
            right: true
        }
        margins {
            top: 0
            right: 0
        }
        implicitWidth: label.implicitWidth + 28
        implicitHeight: label.implicitHeight + 16
        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.layer: WlrLayer.Top
        WlrLayershell.namespace: "caelestia-topclock"
        color: "transparent"
        mask: Region {}

        Item {
            anchors.fill: parent
            clip: true

            // Extends past the top and right screen edges so only the bottom-left corner shows rounded
            StyledRect {
                anchors.fill: parent
                anchors.topMargin: -16
                anchors.rightMargin: -16
                color: Colours.tPalette.m3surfaceContainer
                radius: 16
            }

            StyledText {
                id: label

                anchors.centerIn: parent
                text: Time.format("HH:mm")
                color: Colours.palette.m3tertiary
                font: Tokens.font.body.builders.small.scale(1.2).build()
            }
        }
    }
}
