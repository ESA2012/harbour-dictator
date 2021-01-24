import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    property var decisionsList
    property var onAction

    Component.onCompleted: {
        for(var d = 0; d < decisionsList.length; d++) {
            decisionsModel.append({ id: decisionsList[d].id })
        }
    }

    SilicaFlickable {
        id: flickContainer
        anchors.fill: parent
        contentHeight: container.height
        bottomMargin: Theme.paddingLarge

        VerticalScrollDecorator {}

        PullDownMenu {
            MenuItem {
                text: qsTr("No decision")
                onClicked: onAction({ decision: null })
            }
        }

        Column {
            id: container
            width: parent.width
            spacing: Theme.paddingLarge

            DataTextConstants {
                id: strc
            }

            HeaderComponent { key: "decision" }

            ListModel {
                id: decisionsModel
            }

            SilicaListView {
                model: decisionsModel
                width: parent.width
                height: contentHeight
                visible: decisionsList.length > 0
                spacing: Theme.paddingMedium
                delegate: ListItemButton {
                    text: strc[model.id]
                    onClicked: onAction({ decision: decisionsList[index] })
                }
            }

            Label {
                text: qsTr("ALL of this section used up")
                anchors.centerIn: flickContainer
                width: parent.width - Theme.horizontalPageMargin
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                font.pixelSize: Theme.fontSizeLarge
                visible: decisionsList.length === 0
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
