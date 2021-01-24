import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property var petition
    property var advice
    property var onAction

    DataTextConstants {
        id: strc
    }

    QtObject {
        // Use these text constants for translations
        id: fromText
        readonly property string g0: qsTr("Army")
        readonly property string g1: qsTr("Peasants")
        readonly property string g2: qsTr("Landowners")
        readonly property string g3: qsTr("Guerillas")
        readonly property string g4: qsTr("Leftotans")
        readonly property string g5: qsTr("Secret Police")
        readonly property string g6: qsTr("Russians")
        readonly property string g7: qsTr("Americans")
    }

    Component.onCompleted: {
        var i;
        for(i = 0; i < advice.length; i++) {
            var elem = advice[i]
            model.append({ group: fromText[elem.group.id], value: elem.value, type: elem.type, targetGroup: elem.targetGroup });
        }
    }

    function capitalize(txt) {
        if (typeof txt == "string") {
            return txt.charAt(0).toUpperCase() + txt.slice(1);
        }
        return "";
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: container.height
        bottomMargin: Theme.paddingLarge

        VerticalScrollDecorator { flickable: parent }

        Column {
            id: container
            width: parent.width

            spacing: Theme.paddingLarge

            HeaderComponent {
                key: "advice"
            }

            Text {
                text: capitalize(strc[petition.id])
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: Theme.fontSizeMedium
                wrapMode: Text.WordWrap
                color: Theme.primaryColor
                height: contentHeight + Theme.paddingLarge * 2
                width: parent.width - Theme.horizontalPageMargin * 2
            }

            Divider { }

            Component {
                id: sectionHeading
                Label {
                    text: section === 'p' ? qsTr('Your popularity with....') : qsTr('Your strength with....')
                    font.bold: true
                    height: Theme.itemSizeSmall
                    verticalAlignment: Text.AlignVCenter
                }
            }


            SilicaListView {
                id: list
                model: ListModel {
                    id: model
                }
                width: parent.width - Theme.paddingLarge * 2;
                leftMargin: Theme.paddingLarge;
                rightMargin: Theme.paddingLarge;
                height: contentHeight

                delegate: Item {
                    width: parent.width
                    height: Theme.itemSizeExtraSmall

                    Text {
                        text: group
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: Theme.horizontalPageMargin
                        horizontalAlignment: Text.AlignLeft
                        font.pixelSize: Theme.fontSizeMedium
                        color: palette.highlightColor
                        font.bold: targetGroup
                        font.underline: targetGroup
                    }
                    Text {
                        anchors.right: parent.right
                        anchors.rightMargin: Theme.horizontalPageMargin
                        anchors.verticalCenter: parent.verticalCenter
                        text: (value > 0 && '+') + value
                        font.bold: true
                        horizontalAlignment: Text.AlignRight
                        font.pixelSize: Theme.fontSizeLarge
                        color: value > 0 ? 'green' : 'red'
                    }

                }

                section.property: "type"
                section.criteria: ViewSection.FullString
                section.delegate: sectionHeading
            }
        }
    }
}
