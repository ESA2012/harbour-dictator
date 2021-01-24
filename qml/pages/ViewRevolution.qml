import QtQuick 2.6
import Sailfish.Silica 1.0


Page {
    property var onAction

    HeaderComponent { key: "revolution" }

    SilicaFlickable {
        anchors.fill: parent

        Column {
            id: container
            spacing: Theme.paddingLarge
            width: parent.width
            anchors.centerIn: parent

            Text {
                id: revoText
                text: qsTr("Revolution!!!");
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeExtraLarge
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: parent.width - Theme.paddingLarge * 2
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


            Label {
                id: body
                text: qsTr("Try to escape?")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: Theme.paddingLarge

                Button {
                    text: qsTr("Yes")
                    onClicked: onAction({ tryEscape: true })
                }

                Button {
                    text: qsTr("No")
                    onClicked: onAction({ tryEscape: false })
                }
            }
        }
    }
}
