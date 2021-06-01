import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    property int ritumbanStrength
    property int leftotanStrength
    property var warResult
    property var onAction

    QtObject {
        id: texts
        readonly property string win: qsTr("Leftotans routed!")
        readonly property string lose: qsTr("Leftotan victory...")
        readonly property string escaped: qsTr("You escape by helicopter")
        readonly property string heliBroken: qsTr("Helicopter engine failure")
        readonly property string executed: qsTr("You are judged to be an\nenemy of the people and...\nsummarily executed")
    }

    Component {
        id: warIntroComponent

        Item {
            FillBackground {
                component: warBeginText
                color: "red"
                SequentialAnimation on color {
                    loops: Animation.Infinite
                    ColorAnimation { from: "red"; to: "orange"; duration: 500 }
                    ColorAnimation { from: "orange"; to: "red"; duration: 500 }
                }
            }

            Text {
                id: warBeginText
                anchors.centerIn: parent
                text: qsTr("WAR!!!");
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeExtraLarge
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: parent.width
                height: contentHeight + Theme.paddingLarge * 2
                wrapMode: Text.WordWrap
            }
        }
    }

    Component {
        id: warBeginComponent

        Item {
            FillBackground {
                component: warBegin2Text
                color: "red"
                SequentialAnimation on color {
                    loops: Animation.Infinite
                    ColorAnimation { from: "red"; to: "orange"; duration: 500 }
                    ColorAnimation { from: "orange"; to: "red"; duration: 500 }
                }
            }

            Text {
                id: warBegin2Text
                anchors.centerIn: parent
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeLarge
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: parent.width
                height: contentHeight + Theme.paddingLarge * 2
                wrapMode: Text.WordWrap
                text: qsTr("Leftoto invades")
            }
        }
    }

    Component {
        id: warContComponent

        Item {
            FillBackground {
                component: warContComponentText
                color: "red"
            }

            Text {
                id: warContComponentText
                anchors.centerIn: parent
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeLarge
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: parent.width
                height: contentHeight + Theme.paddingLarge * 2
                wrapMode: Text.WordWrap
                text: qsTr("A short decisive war")
            }
        }
    }

    Component {
        id: warSidesComponent

        Item {
            FillBackground {
                component: wscc
                color: "red"
            }
            Column {
                id: wscc
                anchors.centerIn: parent
                width: parent.width

                KeyValue {
                    key: qsTr("Ritimban strength is")
                    value: ritumbanStrength
                }

                KeyValue {
                    key: qsTr("Leftotan strength is")
                    value: leftotanStrength
                }
            }
        }
    }

    Component {
        id: warResultComponent
        Item {
            FillBackground {
                component: resultListView
                Component.onCompleted: {
                    color = "red";
                    if (warResult.indexOf("win") > -1) {
                        color = "green";
                        return;
                    }
                    if (warResult.indexOf("escaped") > -1) {
                        color = "yellow";
                        return;
                    }
                }
            }
            SilicaListView {
                anchors.centerIn: parent
                id: resultListView
                model: ListModel {
                    id: warResultModel
                }
                spacing: Theme.paddingLarge
                width: parent.width
                height: contentHeight
                delegate: Text {
                    text: wt
                    wrapMode: Text.Wrap
                    color: Theme.primaryColor
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    width: parent.width
                    font.pixelSize: Theme.fontSizeLarge
                    height: contentHeight + Theme.paddingMedium * 2
                }

                Component.onCompleted: {
                    for (var i = 0; i < warResult.length; i++) {
                        warResultModel.append({ wt: texts[warResult[i]] });
                    }
                }
            }
        }
    }

    HeaderComponent {
        key: "war"
    }

    Timer {
        id: warTimer
        property int times: 0
        interval: 3000
        repeat: true
        running: true
        onTriggered: {
            times++;
            if (times == 1) warloader.sourceComponent = warBeginComponent;
            if (times == 2) warloader.sourceComponent = warSidesComponent;
            if (times == 3) warloader.sourceComponent = warContComponent;
            if (times == 4) {
                warloader.sourceComponent = warResultComponent;
                warTimer.stop();
                buttonOk.visible = true;
            }
        }
    }

    Loader {
        id: warloader
        sourceComponent: warIntroComponent
        anchors.fill: parent
        anchors.margins: {
            right: Theme.paddingLarge
            left: Theme.paddingLarge
        }

        opacity: 1
        onLoaded: animation.start()

        NumberAnimation on opacity {
            id: animation
            from: 0
            to: 1
            duration: 500
        }
    }

    ButtonOk {
        id: buttonOk
        visible: false
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge
        onClicked: onAction({})
    }
}
