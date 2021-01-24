import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    property int swissBefore
    property int treasuryBefore
    property int stolen
    property int swissAfter
    property int treasuryAfter
    property var onAction


    QtObject {
        id: viewValues
        property int viewStolen: 0
        property int viewTreasury: treasuryBefore
    }

    Timer {
        id: timer
        interval: 5
        repeat: true
        running: true
        onTriggered: {
            viewValues.viewStolen += 1;
            viewValues.viewTreasury -= 1;
            if (viewValues.viewStolen === stolen) timer.stop();
        }
    }

    HeaderComponent {
        key: "swissBankTransfer"
    }

    FillBackground {
        component: container
        color: "cyan"
    }

    Column {
        id: container
        anchors.centerIn: parent
        width: parent.width - Theme.paddingLarge * 2
        spacing: Theme.paddingLarge

        KeyValue {
            id: trText
            key: qsTr("The treasury held")
            value: qsTr("%1,000").arg(viewValues.viewTreasury)
        }

        KeyValue {
            id: stText
            key: qsTr("Has been transfered")
            value: qsTr("%1,000").arg(viewValues.viewStolen)
        }
    }

    ButtonOk {
        visible: timer.running === false
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge
        onClicked: onAction({})
    }

}
