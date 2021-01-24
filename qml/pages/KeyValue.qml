import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    property alias key: keyText.text
    property alias value: valueText.text

    height: Theme.itemSizeSmall
    width: parent.width

    Text {
        id: keyText
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: Theme.horizontalPageMargin
        }
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: Theme.fontSizeMedium
        color: Theme.primaryColor
        font.bold: false
    }

    Text {
        id: valueText
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            rightMargin: Theme.horizontalPageMargin
        }
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: Theme.fontSizeMedium
        color: Theme.primaryColor
        font.bold: true
    }
}
