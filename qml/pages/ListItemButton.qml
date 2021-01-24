import QtQuick 2.0
import Sailfish.Silica 1.0


BackgroundItem {
    id: itemButton
    width: parent.width - Theme.horizontalPageMargin * 2
    anchors.horizontalCenter: parent.horizontalCenter
    height: itemText.height
    property alias text: itemText.text
//    signal clicked

    Text {
        id: itemText
        text: viewText
        color: Theme.primaryColor
        anchors {
            left: parent.left
            right: itemIcon.left
        }
        wrapMode: Text.WordWrap
        height: contentHeight + Theme.paddingLarge * 2
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: Theme.fontSizeMedium
    }

    Icon {
        id: itemIcon
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        source: getIcon("icon-m-right", pressed)
//        onClicked: itemButton.clicked()
    }

    Separator {
        height: 1
        color: Theme.highlightColor
        anchors {
            bottom: itemText.bottom
            left: itemText.left
            right: itemIcon.right
        }

    }

    Separator {
        height: 1
        color: Theme.highlightColor
        anchors {
            top: itemText.top
            left: itemText.left
            right: itemIcon.right
        }
    }

    function getIcon(iconName, pressed) {
        return "image://theme/" + iconName + "?"
                + (pressed ? Theme.highlightColor : Theme.primaryColor);
    }
}

