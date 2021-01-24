import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    property var news
    property var onAction

    HeaderComponent {
        key: "news"
    }

    DataTextConstants {
        id: strc
    }


    Rectangle {
        id: newspaper
        color: "#FFFFFF"
        height: paperColumn.height + Theme.paddingLarge
        width: Screen.width - Theme.paddingLarge * 2
        anchors.centerIn: parent
        opacity: 1

        RotationAnimation on rotation { from: 0; to: 720; duration: 1000 }

        NumberAnimation on scale { from: 2; to: 1; duration: 1000 }

        NumberAnimation on opacity { from: 0; to: 1; duration: 1000 }

        Component {
            id: lines
            Column {
                spacing: 10
                Repeater {
                    model: 13
                    Rectangle {
                        color: "#000000"
                        height: 3
                        width: newspaper.width / 4
                    }
                }
            }
        }

        Column {
            id: paperColumn
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("RITIMBANIA TIMES")
                color: "#000000"
                font.bold: true
                font.pixelSize: 56
            }
            Rectangle {
                color: "#000000"
                height: 4
                width: newspaper.width - newspaper.width / 6
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {
                text: strc[news.id]
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 38
                font.letterSpacing: 5
                width: parent.width
                height: contentHeight + 10
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            Rectangle {
                color: "#000000"
                height: 4
                width: newspaper.width - newspaper.width / 6
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row {
                topPadding: 10
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle { color: "#AAAAAA"; height: newspaper.width / 4; width: newspaper.width / 4 }
                Loader { sourceComponent: lines }
                Loader { sourceComponent: lines }
            }
        }
    }

    ButtonOk {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge
        onClicked: onAction({ })
    }
}
