import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property var onAction
    property var allies
    property int revolutionaryStrenth
    property int yourStrength

    SilicaFlickable {
        anchors.fill: parent

        HeaderComponent {
            key: "revolution"
        }

        Column {
            id: container
            width: parent.width
            spacing: Theme.paddingLarge
            anchors.centerIn: parent

            Text {
                id: revoText
                text: qsTr("The revolution has started")
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeExtraLarge
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: parent.width - Theme.paddingLarge * 4
                height: contentHeight + Theme.paddingLarge * 2
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter

                FillBackground {
                    color: "red"
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation { from: "red"; to: "orange"; duration: 500 }
                        ColorAnimation { from: "orange"; to: "red"; duration: 500 }
                    }
                }
            }

            Divider {}

            KeyValue {
                key: qsTr("Your stength is")
                value: yourStrength
            }

            KeyValue {
                key: qsTr("Strength of %1 is").arg(allies ? allies.name : '')
                value: allies ? allies.strength : ''
                visible: Boolean(allies)
            }

            KeyValue {
                key: qsTr("The revolutionary's is")
                value: revolutionaryStrenth
            }

            Divider {}
        }

        ButtonOk {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Theme.paddingLarge
            id: okButton
            onClicked: onAction()
        }
    }
}
