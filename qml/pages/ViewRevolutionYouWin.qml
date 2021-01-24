import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property var onAction

    SilicaFlickable {
        anchors.fill: parent

        HeaderComponent {
            key: "revolution"
        }

        Item {
            anchors.centerIn: parent
            width: parent.width - Theme.horizontalPageMargin * 2
            height: componetsColums.height

            Column {
                id: componetsColums
                width: parent.width
                spacing: Theme.paddingLarge

                Text {
                    text: qsTr("The revolt has been crushed!<br/></br/>Punish the revolutionaries?")
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: Theme.fontSizeLarge
                    color: Theme.primaryColor
                    wrapMode: Text.WordWrap
                }

                Divider { }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter

                    spacing: Theme.paddingLarge

                    Button {
                        text: qsTr("Yes")
                        onClicked: {
                            onAction({ punish: true })
                        }
                    }

                    Button {
                        text: qsTr("No")
                        onClicked: {
                            onAction({ punish: true })
                        }
                    }
                }
            }
        }
    }
}
