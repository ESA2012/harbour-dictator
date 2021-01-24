import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    property var name
    property var aidResult
    property var onAction
    property var decision

    DataTextConstants {
        id: texts
    }

    QtObject {
        id: aidText
        readonly property string too_early: qsTr("It's too early to give aid")
        readonly property string no_more: qsTr("Very sorry, no more loans")
        readonly property string no_rus: qsTr("Net!")
        readonly property string no_us: qsTr("No!")
        readonly property string loan: qsTr("%1 will let you have %2,000").arg(name).arg(aidResult)
    }

    Timer {
        id: aidTimer
        interval: 2000
        running: true
        repeat: false
        onTriggered: {
            requestResultText.enabled = true;
        }
    }

    HeaderComponent {
        key: "aid"
    }

    FillBackground {
        component: container
        color: "cyan"
    }

    Column {
        id: container
        width: parent.width - Theme.paddingLarge * 2
        anchors.centerIn: parent

        Text {
            text: texts[decision.id]
            color: Theme.primaryColor
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: Theme.fontSizeMedium
            height: contentHeight + Theme.paddingLarge * 2
            wrapMode: Text.WordWrap
        }

        Divider {
            width: parent.width - Theme.paddingLarge * 2
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            property bool enabled: false
            id: requestResultText
            text: enabled ? (aidText[aidResult] || aidText.loan) : ""
            color: Theme.primaryColor
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            height: contentHeight + Theme.paddingLarge * 2
            font.pixelSize: Theme.fontSizeMedium
            wrapMode: Text.WordWrap
            font.bold: true

            BusyIndicator {
                 size: BusyIndicatorSize.Medium
                 anchors.centerIn: parent
                 running: !requestResultText.enabled
            }
        }
    }

    ButtonOk {
        id: button
        enabled: requestResultText.enabled
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge
        onClicked: onAction({ })
    }
}
