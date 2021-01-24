import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property var onAction
    property var from
    property var to

    QtObject {
        id: vars
        property int treasury: from.treasury
        property int monthlyCost: from.monthlyCost
        property int swissBankAccount: from.swissBankAccount
        property int iteration: 0
        property int dt: to.treasury > from.treasury ? +1 : -1
        property int dm: to.monthlyCost > from.monthlyCost ? +1 : -1
        property int ds: to.swissBankAccount > from.swissBankAccount ? +1 : -1
    }

    Timer {
        id: timer
        interval: 5
        repeat: true
        running: true
        onTriggered: {
            vars.iteration += 1;
            if (vars.iteration < 120) return;

            if (vars.treasury !== to.treasury) {
                vars.treasury += vars.dt;
                return;
            }

            if (vars.monthlyCost !== to.monthlyCost) {
                vars.monthlyCost += vars.dm
                return;
            }

            if (vars.swissBankAccount !== to.swissBankAccount) {
                vars.swissBankAccount += vars.ds
                return;
            }

            timer.stop();
        }
    }

    HeaderComponent { key: "account" }

    FillBackground {
        component: container
    }

    Column {
        id: container
        anchors.centerIn: parent
        width: parent.width - Theme.paddingLarge * 2
        spacing: Theme.paddingLarge

        KeyValue {
            id: treasury
            key: qsTr("The treasury %1").arg(vars.treasury > 0 ? qsTr("holds") : qsTr("owes"))
            value: qsTr("%1,000").arg(vars.treasury)
        }

        KeyValue {
            id: monthlyCost
            key: qsTr("Monthly costs are")
            value: qsTr("%1,000").arg(vars.monthlyCost)
        }

        KeyValue {
            id: swiss
            key: qsTr("Swiss acct holds")
            value: qsTr("%1,000").arg(vars.swissBankAccount)
            visible: Boolean(vars.swissBankAccount)
        }
    }

    ButtonOk {
        id: button
        visible: !timer.running
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge
        onClicked: onAction({})
    }
}
