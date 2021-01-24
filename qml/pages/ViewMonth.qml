import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property string month
    property var onAction

    Timer {
        id: timer
        repeat: false
        interval: 2000
        running: true
        onTriggered: onAction({})
    }

    Label {
        text: qsTr("Month %1").arg(month)
        anchors.centerIn: parent
        font.pixelSize: Theme.fontSizeLarge
    }
}
