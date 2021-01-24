import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    property Item component: parent
    width: component.width
    height: component.height
    anchors.centerIn: component
    anchors.margins: Theme.paddingLarge
    color: "#20FF20"
    opacity: 0.25
    radius: Theme.paddingSmall
    z: -1
}
