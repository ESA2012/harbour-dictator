import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    property var onAction

    SilicaFlickable {
        contentHeight: container.height
        bottomMargin: Theme.paddingLarge
        anchors.fill: parent

        VerticalScrollDecorator {}

        PullDownMenu {
            MenuItem {
                text: qsTr("No decision")
                onClicked: onAction({ decision: "6" })
            }
        }

        ListModel {
            id: decisionGroups
            ListElement { viewText: qsTr("PLEASE a GROUP"); decision: "1" }
            ListElement { viewText: qsTr("PLEASE ALL GROUPS"); decision: "2" }
            ListElement { viewText: qsTr("IMPROVE your CHANCES"); decision: "3" }
            ListElement { viewText: qsTr("RAISE some CASH"); decision: "4" }
            ListElement { viewText: qsTr("STRENGTHEN a GROUP"); decision: "5" }
        }

        Column {
            id: container
            spacing: Theme.paddingLarge
            width: parent.width

            HeaderComponent { key: "decision" }

            Label {
                id: body
                text: qsTr("Try to...")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            SilicaListView {
                width: parent.width
                height: contentHeight
                spacing: Theme.paddingMedium
                model: decisionGroups
                delegate: ListItemButton {
                    text: viewText
                    onClicked: onAction({ decision: decision })
                }
            }
        }
    }
}
