import QtQuick 2.0
import Sailfish.Silica 1.0

PageHeader {
    property alias backgroundColor: bg.color
    property string key: ""

    title: values[key] || ""

    QtObject {
        id: values
        readonly property string account: qsTr("Treasury report")
        readonly property string decision: qsTr("Presidential decision")
        readonly property string report: qsTr("Police report")
        readonly property string revolution: qsTr("Revolution")
        readonly property string welcome: qsTr("Welcome")
        readonly property string warThreat: qsTr("Threat of war")
        readonly property string war: qsTr("War")
        readonly property string dictator: qsTr("Dictator")
        readonly property string swissBankTransfer: qsTr("Swiss bank account")
        readonly property string revEscape: qsTr("Try to escape")
        readonly property string news: qsTr("Newsflash")
        readonly property string intro: qsTr("Intro")
        readonly property string gameover: qsTr("Game Over")
        readonly property string bankrupt: qsTr("Bankrupt")
        readonly property string audience: qsTr("Audience")
        readonly property string assassin: qsTr("Assassination attempt")
        readonly property string aid: qsTr("Foreign ait")
        readonly property string advice: qsTr("Advice")
        readonly property string info: qsTr("Infomation")
    }

    titleColor: Theme.primaryColor
    FillBackground {
        id: bg
        radius: 0
        opacity: 0.1
        color: "#000"
    }
}
