import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent

        VerticalScrollDecorator { flickable: parent }

        Column {
            width: parent.width
            spacing: Theme.paddingLarge

            HeaderComponent {
                key: "info"
            }

            Label {
                text: qsTr("Dictator")
                font.pixelSize: Theme.fontSizeExtraLarge
                font.weight: Font.Black
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                text: qsTr("Remake of old ZX Spectrum game")
                font.pixelSize: Theme.fontSizeLarge
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - Theme.horizontalPageMargin * 2
                wrapMode: Text.WordWrap
            }

            DetailItem {
                label: qsTr("Version")
                value: "0.9"
            }

            DetailItem {
                label: qsTr("Originally devised and written by")
                value: qsTr("Don Priestley")
            }

            DetailItem {
                label: qsTr("Russian translation (original)")
                value: qsTr("Ю. и Н. Родионовы")
            }

            DetailItem {
                label: qsTr("Based on remake written by")
                value: qsTr("kastian")
            }

            DetailItem {
                label: qsTr("Sailfish OS version (rewritten in javascript, don't ask me why)")
                value: qsTr("SnakE")
            }
        }
    }
}
