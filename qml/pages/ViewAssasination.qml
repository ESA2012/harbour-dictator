import QtQuick 2.6
import Sailfish.Silica 1.0


Page {
    property var assasin
    property bool alive
    property var onAction

    Component.onCompleted: {
        console.log(JSON.stringify(assasin));
    }

    QtObject {
        // Use these text constants for translations
        id: whoIsAssassin
        readonly property string g0: qsTr("Army")
        readonly property string g1: qsTr("Peasants")
        readonly property string g2: qsTr("Landowners")
        readonly property string g3: qsTr("Guerillas")
        readonly property string g4: qsTr("Leftotans")
        readonly property string g5: qsTr("Secret police")
        readonly property string g6: qsTr("Russians")
        readonly property string g7: qsTr("Americans")
    }

    Component {
        id: attemptTextComponent

        Item {
            height: txtAtt.height

            FillBackground {
                component: txtAtt
                color: "red"
                SequentialAnimation on color {
                    loops: Animation.Infinite
                    ColorAnimation { from: "red"; to: "orange"; duration: 500 }
                    ColorAnimation { from: "orange"; to: "red"; duration: 500 }
                }
            }

            Text {
                id: txtAtt
                text: qsTr("Assasination attempt<br/>by one of <b>%1</b>").arg(whoIsAssassin[assasin.id])
                width: parent.width
                height: contentHeight + Theme.paddingLarge * 2
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeExtraLarge
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }
        }
    }

    Component {
        id: resultTextComponent

        Item {
            height: resAtt.height

            FillBackground {
                component: resAtt
                color: alive ? "green" : "red"
            }

            Text {
                id: resAtt
                text: alive ? qsTr("Attempt failed") : qsTr("You're dead")
                width: parent.width
                height: contentHeight + Theme.paddingLarge * 2
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeExtraLarge
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }
        }
    }

    HeaderComponent {
        key: "assassin"
    }

    Timer {
        id: timer
        property int times: 0
        interval: 3000
        repeat: true
        running: true
        onTriggered: {
            times++;
            if (times == 1) {
                loader.sourceComponent = resultTextComponent;
                timer.stop();
                buttonOk.visible = true;
            }
        }
    }

    Loader {
        id: loader
        anchors.centerIn: parent
        width: parent.width - Theme.paddingLarge * 2
        opacity: 1
        sourceComponent: attemptTextComponent
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
        onClicked: onAction({ })
    }
}
