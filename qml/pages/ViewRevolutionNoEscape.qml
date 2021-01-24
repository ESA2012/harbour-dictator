import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property var onAction
    property var rAllies
    property var rGroup
    property int revolutionaryStrenth
    property var availableAllies

    Component.onCompleted: {
        for(var a = 0; a < availableAllies.length; a++) {
            allies.append({ id: availableAllies[a].id, name: availableAllies[a].name })
        }
    }

    QtObject {
        // Use these text constants for translations
        id: revoGroupsText
        readonly property string g0: qsTr("Army")
        readonly property string g1: qsTr("Peasants")
        readonly property string g2: qsTr("Landowners")
        readonly property string g3: qsTr("Guerillas")
        readonly property string g4: qsTr("Leftotans")
        readonly property string g5: qsTr("Secret Police")
        readonly property string g6: qsTr("Russians")
        readonly property string g7: qsTr("Americans")
    }

    QtObject {
        // Use these text constants for translations
        id: revoAlliesText
        readonly property string g0: qsTr("with Army")
        readonly property string g1: qsTr("with Peasants")
        readonly property string g2: qsTr("with Landowners")
        readonly property string g3: qsTr("with Guerillas")
        readonly property string g4: qsTr("with Leftotans")
        readonly property string g5: qsTr("with Secret Police")
        readonly property string g6: qsTr("with Russians")
        readonly property string g7: qsTr("with Americans")
    }

    SilicaFlickable {
        anchors.fill: parent

        VerticalScrollDecorator {
            flickable: parent
        }

        Column {
            id: container
            width: parent.width
            spacing: Theme.paddingLarge

            HeaderComponent {
                key: "revolution"
            }

            Label {
                width: parent.width - Theme.horizontalPageMargin * 2
                text: qsTr("%1 have joined %2").arg(revoGroupsText[rGroup.id]).arg(rAllies ? revoAlliesText[rAllies.id] : '')
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                visible: availableAllies.length > 0
            }

            Label {
                width: parent.width - Theme.horizontalPageMargin * 2
                text: qsTr("Their combined strenght is %1").arg(revolutionaryStrenth)
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                visible: availableAllies.length > 0
            }

            Divider {}

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Who are you asking for help?")
                visible: availableAllies.length > 0
            }

            ListModel {
                id: allies
            }

            SilicaListView {
                id: viewList
                model: allies
                width: parent.width
                height: contentHeight
                visible: availableAllies.length > 0
                delegate: Item {
                    height: Theme.itemSizeMedium
                    width: parent.width

                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width - Theme.paddingLarge * 2
                        text: model.name
                        onClicked: {
                            viewList.enabled = false;
                            onAction({ allies: availableAllies[index], jokePanel: jokePanel })
                        }
                    }
                }
            }


        //    No allies

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("You're on your own!")
                visible: availableAllies.length === 0
            }

            ButtonOk {
                onClicked: onAction({ allies: null })
                visible: availableAllies.length === 0
            }
        }
    }

    DockedPanel {
        id: jokePanel
        width: parent.width
        height: Theme.itemSizeExtraLarge
        dock: Dock.Bottom
        opacity: 1

        Label {
            anchors.centerIn: parent
            text: qsTr("You must be joking!")
            font.bold: true
        }
    }
}
