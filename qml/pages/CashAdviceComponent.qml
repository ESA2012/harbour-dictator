import QtQuick 2.0
import Sailfish.Silica 1.0

SilicaListView {
    property var adviceFor
    property int treasury
    property bool usedRu
    property bool usedUs
    readonly property bool canApply: cash_advice()

    id: adviceList
    width: parent.width - Theme.paddingLarge * 2
    anchors.horizontalCenter: parent.horizontalCenter
    height: contentHeight

    model: ListModel {
        id: adviceModel
    }

    QtObject {
        id: strings
        readonly property string noMoney: qsTr("No money involved")
        readonly property string noCash: qsTr("The cash for this decision is not in the treasury")
        readonly property string ruAid: qsTr("Perhaps the Russians can help?")
        readonly property string usAid: qsTr("The Americans are generous folk")
        readonly property string insufficientFunds: qsTr("You have insufficient funds to pay for this decision")
        readonly property string decisionWould: qsTr("This decision would")
        readonly property string tr: qsTr("%1 the treasury %2,000")
        readonly property string add: qsTr("add to")
        readonly property string take: qsTr("take from")
        readonly property string monthly: qsTr("%1 monthly costs by %2,000")
        readonly property string lower: qsTr("lower")
        readonly property string raise: qsTr("raise")
        readonly property string and: qsTr("and")
    }

    FillBackground {
        id: background
        component: adviceList
        color: "transparent"
    }

    delegate: Item {
        height: delegateText.height + Theme.paddingSmall
        width: parent.width
        Text {
            id: delegateText
            width: parent.width
            text: model.line
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: Theme.fontSizeSmall
            color: Theme.primaryColor
        }
    }

    function cash_advice() {
        adviceModel.clear();
        var cost = 10 * (adviceFor.cost.charCodeAt(0) - "M".charCodeAt(0))
        var monthlyCost = adviceFor.monthly_cost.charCodeAt(0) - "M".charCodeAt(0)

        if (cost === 0 && monthlyCost === 0) {
            adviceModel.append({ line: strings.noMoney });
            background.color = "green";
            return true;
        }

        if ((cost < 0 || monthlyCost < 0) && (treasury + cost < 0 || treasury + monthlyCost < 0)) {
            if (!adviceFor.author) {
                adviceModel.append({ line: strings.noCash });
                if (!usedRu) adviceModel.append({ line: strings.ruAid });
                if (!usedUs) adviceModel.append({ line: strings.usAid });
            } else {
                adviceModel.append({ line: strings.insufficientFunds });
            }
            background.color = "red";
            return false;
        } else {
            adviceModel.append({ line: strings.decisionWould });
            if (cost !== 0) adviceModel.append({ line: strings.tr.arg(cost > 0 ? strings.add : strings.take).arg(Math.abs(cost)) });
            if (monthlyCost !== 0) {
                if (cost !== 0) adviceModel.append({ line: strings.and });
                adviceModel.append({ line: strings.monthly.arg(monthlyCost > 0 ? strings.lower : strings.raise).arg(Math.abs(monthlyCost)) });
            }
            background.color = "yellow";
        }
        return true;
    }
}
