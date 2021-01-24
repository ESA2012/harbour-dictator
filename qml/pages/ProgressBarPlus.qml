import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    property int minimumValue: 0
    property int maximumValue: 100
    property int value: 50

    property alias backgroundColor: background.color
    property alias color: foreground.color
    property alias textColor: valueText.color

    property bool mirrored

    id: background
    color: "white"
    height: parent.height
    width: parent.width
    border.color: "#000000"
    border.width: 1

    function calculate() {
        if (value <= minimumValue) {
            value = minimumValue;
            return 0;
        }
        if (value >= maximumValue) {
            value = maximumValue;
            return background.width;
        }
        var k = background.width / (maximumValue - minimumValue);
        return (value - minimumValue) * k;
    }

    Rectangle {
        id: foreground
        height: background.height
        border.color: background.border.color
        border.width: 1
        color: "#000000"
        x: background.x
        anchors.left: mirrored ? undefined: parent.left
        anchors.right: mirrored ? parent.right : undefined
        width: calculate()
        opacity: 0.5
        radius: 4
    }

    OpacityRampEffect {
        sourceItem: foreground
        direction: mirrored ? OpacityRamp.LeftToRight : OpacityRamp.RightToLeft
    }

    Text {
        id: valueText
        text: value
        anchors.horizontalCenter: foreground.horizontalCenter
        anchors.verticalCenter: foreground.verticalCenter
        font.pixelSize: background.height - 4
        color: Theme.primaryColor
        visible: value != minimumValue
        font.bold: true
    }
}



