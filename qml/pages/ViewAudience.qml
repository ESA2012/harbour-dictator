import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property var petition
    property int treasury
    property bool usedRU
    property bool usedUS
    property var onAction

    Component.onCompleted: {
        cashAdvice.treasury = treasury
        cashAdvice.usedRu = usedRU
        cashAdvice.usedUs = usedUS
        cashAdvice.adviceFor = petition
    }

    DataTextConstants {
        id: strc
    }

    QtObject {
        // Use these text constants for translations
        id: fromText
        readonly property string g0: qsTr("ARMY")
        readonly property string g1: qsTr("PEASANTS")
        readonly property string g2: qsTr("LANDOWNERS")
        readonly property string g3: qsTr("GUERILLAS")
        readonly property string g4: qsTr("LEFTOTANS")
        readonly property string g5: qsTr("SECRET POLICE")
        readonly property string g6: qsTr("RUSSIANS")
        readonly property string g7: qsTr("AMERICANS")
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: container.height
        bottomMargin: Theme.paddingLarge

        PullDownMenu {
            MenuItem {
                text: qsTr("Advice")
                onClicked: {
                    onAction({ audienceResult: 'advice', petition: petition })
                }
            }
        }

        Column {
            id: container
            width: parent.width
            spacing: Theme.paddingLarge

            HeaderComponent {
                key: "audience"
            }

            Text {
                id: authorText
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - Theme.paddingLarge * 2
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                height: contentHeight + Theme.paddingMedium * 2
                text: qsTr("A requst from <b>%1</b>").arg(fromText[petition.author.id])
                font.pixelSize: Theme.fontSizeLarge
                color: Theme.primaryColor
                wrapMode: Text.WordWrap
            }

            Item {
                width: parent.width
                height: childrenRect.height

                FillBackground {
                    component: audbody
                    color: "cyan"
                }

                Column {
                    id: audbody
                    width: parent.width - Theme.paddingLarge * 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: Theme.paddingLarge

                    Text {
                        horizontalAlignment: Text.AlignHCenter
                        text: qsTr("Will your excellency agree to")
                        font.pixelSize: Theme.fontSizeMedium
                        color: Theme.primaryColor
                        width: parent.width - Theme.paddingLarge * 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: contentHeight + Theme.paddingLarge
                        verticalAlignment: Text.AlignBottom
                        wrapMode: Text.WordWrap
                    }

                    Text {
                        horizontalAlignment: Text.AlignHCenter
                        text: strc[petition.id]
                        font.pixelSize: Theme.fontSizeLarge
                        color: Theme.primaryColor
                        width: parent.width - Theme.paddingLarge * 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        wrapMode: Text.WordWrap
                        height: contentHeight + Theme.paddingLarge
                        verticalAlignment: Text.AlignTop
                    }
                }
            }

            CashAdviceComponent {
                id: cashAdvice
                adviceFor: petition
                treasury: treasury
                usedRu: usedRU
                usedUs: usedUS
            }

            Divider { }

            Label {
                id: decision
                text: qsTr("Decision")
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: Theme.paddingLarge
                height: passButton.height + Theme.paddingLarge

                Button {
                    id: passButton
                    text: qsTr("Pass")
                    enabled: cashAdvice.canApply
                    onClicked: onAction({ audienceResult: 'pass' })
                }

                Button {
                    text: qsTr("Refuse")
                    onClicked: onAction({ audienceResult: 'refuse' })
                }
            }
        }
    }
}
