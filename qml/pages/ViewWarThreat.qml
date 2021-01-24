import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    property var onAction

    HeaderComponent {
        key: "warThreat"
    }

    Text {
        id: body
        anchors.centerIn: parent
        text: qsTr("Threat of war with Leftoto. Your polarity in Ritimba will rise");
        height: contentHeight + Theme.paddingLarge * 2
        width: parent.width - Theme.paddingLarge * 2
        color: Theme.primaryColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        font.pixelSize: Theme.fontSizeMedium

        FillBackground {
            color: "red"
        }
    }

    Timer {
        id: timer
        repeat: false
        interval: 2000
        running: true
        onTriggered: onAction({})
    }
}
