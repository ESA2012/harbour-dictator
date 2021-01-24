import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property var decision
    property int treasury
    property bool usedRU
    property bool usedUS
    property var onAction

    Component.onCompleted: {
        cashAdvice.treasury = treasury
        cashAdvice.usedRu = usedRU
        cashAdvice.usedUs = usedUS
        cashAdvice.adviceFor = decision

        var moneyDicision = ["d13", "d14", "d15"].indexOf(decision.id) > -1;

        adviceButton.enabled = !moneyDicision;
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: container.height

        PullDownMenu {
            MenuItem {
                id: adviceButton
                text: qsTr("Advice")
                onClicked: onAction({ adviceResult: 'advice', decision: decision })
            }
        }

        DataTextConstants {
            id: strc
        }

        Column {
            id: container
            width: parent.width

            spacing: Theme.paddingLarge

            HeaderComponent { key: "decision" }

            Item {
                height: desicionText.height + Theme.paddingMedium * 2
                width: parent.width - Theme.paddingLarge * 2
                anchors.horizontalCenter: parent.horizontalCenter

                FillBackground {
                    component: parent
                    color: "cyan"
                }

                Text {
                    id: desicionText
                    width: parent.width
                    anchors.centerIn: parent
                    height: contentHeight + Theme.paddingLarge * 2
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: strc[decision.id]
                    font.pixelSize: Theme.fontSizeLarge
                    color: Theme.primaryColor
                    wrapMode: Text.WordWrap
                }
            }

            CashAdviceComponent {
                id: cashAdvice
                adviceFor: decision
                treasury: treasury
                usedRu: usedRU
                usedUs: usedUS
            }

            Divider { }


            Label {
                text: qsTr("Decision")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter

                spacing: Theme.paddingLarge

                Button {
                    id: passButton
                    text: qsTr("Apply")
                    enabled: cashAdvice.canApply
                    onClicked: onAction({ adviceResult: 'pass' })
                }

                Button {
                    text: qsTr("Refuse")
                    onClicked: onAction({ adviceResult: 'refuse' })
                }
            }
        }
    }
}
