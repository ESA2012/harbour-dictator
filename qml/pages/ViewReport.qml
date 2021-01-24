import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    property int month: 0
    property int yourStrength: 0
    property int revolutionStrength: 0
    property var groups: ([])
    property var onAction

    Component.onCompleted: {
        for(var i = 0; i < groups.length; i++) {
            groupsModel.append({
                strength: groups[i].strength,
                popularity: groups[i].popularity,
                name: groups[i].name
            })
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: container.height
        bottomMargin: Theme.paddingLarge

        VerticalScrollDecorator { flickable: parent }

        Column {
            id: container
            spacing: Theme.paddingLarge
            width: parent.width

            HeaderComponent { key: "report" }

            Label {
                id: monthText
                text: qsTr("Month %1").arg(month)
                horizontalAlignment: Text.AlignHCenter
                visible: month > 0
                anchors.horizontalCenter: parent.horizontalCenter
            }


            Divider { }

            SilicaListView {
                id: listView
                height: contentHeight
                width: parent.width
                model: ListModel {
                    id: groupsModel
                }

                header: Row {
                    height: Theme.itemSizeExtraSmall
                    leftPadding: Theme.paddingMedium
                    rightPadding: Theme.paddingMedium

                    Text {
                        id: columnp
                        text: qsTr("Popularity")
                        width: listView.width / 2 - columng.width / 2 - parent.leftPadding
                        height: parent.height
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text {
                        id: columng
                        text: qsTr("Group")
                        wrapMode: Text.WrapAnywhere
                        width: 200
                        height: parent.height
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text {
                        id: columns
                        text: qsTr("Strength")
                        width: listView.width / 2 - columng.width / 2 - parent.rightPadding
                        height: parent.height
                        font.pixelSize: Theme.fontSizeExtraSmall
                        color: Theme.primaryColor
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                    }

                }

                delegate: Row {
                    height: Theme.itemSizeExtraSmall
                    leftPadding: Theme.paddingMedium
                    rightPadding: Theme.paddingMedium

                    ProgressBarPlus {
                        id: barp
                        width: listView.width / 2 - name.width / 2 - parent.leftPadding
                        minimumValue: 0
                        maximumValue: 9
                        value: model.popularity
                        height: parent.height / 2
                        backgroundColor: 'transparent'
                        border.color: 'transparent'
                        color: "#00FF00"
                        mirrored: true
                        y: parent.height / 4
                    }

    //                Icon {
    //                    width: 96
    //                    source: "image://theme/icon-m-contact"
    //                    color: palette.highlightColor
    //                }

                    // status???
                    Text {
                        id: name
                        text: model.name
                        wrapMode: Text.WrapAnywhere
                        width: 200
                        height: parent.height
                        font.pixelSize: Theme.fontSizeTiny
                        color: palette.highlightColor
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    ProgressBarPlus {
                        id: bars
                        width: listView.width / 2 - name.width / 2 - parent.rightPadding
                        minimumValue: 0
                        maximumValue: 9
                        value: model.strength
                        height: parent.height / 2
                        backgroundColor: 'transparent'
                        border.color: 'transparent'
                        color: "#F00F00"
                        y: parent.height / 4
                    }
                }
            }


            Divider { }

            KeyValue {
                key: qsTr("Your strength is")
                value: yourStrength
            }

            KeyValue {
                key: qsTr("Sthenght for revolution is")
                value: revolutionStrength
            }

            Divider { }

            ButtonOk {
                onClicked: {
                    onAction({ })
                }
            }
        }
    }
}
