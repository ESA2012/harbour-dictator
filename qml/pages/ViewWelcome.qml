import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    id: page
    property var onAction
    property int history

    SilicaFlickable {
        anchors.fill: parent

        HeaderComponent {
            key: "welcome"
        }

        Column {
            id: container
            anchors.centerIn: parent
            width: parent.width - Theme.paddingLarge * 2
            spacing: Theme.paddingLarge

            Label {
                id: helloText
                font.pixelSize: Theme.fontSizeExtraLarge
                horizontalAlignment: Text.AlignHCenter
                height: contentHeight
                width: parent.width
                wrapMode: Text.WordWrap
                font.bold: true
                text: qsTr("Welcome to office")
            }


            Label {
                font.pixelSize: Theme.fontSizeLarge
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                height: contentHeight
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("The best Dictator of our beloved country of RITIMBA had a final rating of %1.").arg(history)
            }

            Label {
                font.pixelSize: Theme.fontSizeLarge
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                height: contentHeight
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                text: Boolean(history)
                      ? qsTr("You can always try for %1.").arg(history + 1)
                      : qsTr("As this is your first attempt you will no doubt do better!")
            }

            Label {
                visible: Boolean(history)
                font.pixelSize: Theme.fontSizeLarge
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                height: contentHeight
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Start with a Theasury Report and a Police Report (free).")
            }
        }

        ButtonOk {
            onClicked: onAction()
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Theme.paddingLarge
        }
    }
}
