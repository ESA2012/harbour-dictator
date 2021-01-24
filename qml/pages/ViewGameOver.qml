import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    property var onAction
    property int month
    property bool alive
    property int total
    property int history
    property int popularity
    property int swiss

    SilicaFlickable {
        contentHeight: container.height
        bottomMargin: Theme.paddingLarge
        anchors.fill: parent

        VerticalScrollDecorator {}

        Column {
            id: container
            width: parent.width
            spacing: Theme.paddingLarge

            HeaderComponent {
                key: "gameover"
            }

            Label {
                text: qsTr("Your rating as President")
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
            }

            Divider {}

            KeyValue {
                key: qsTr("Total popularity")
                value: popularity
            }

            KeyValue {
                key: qsTr("Months in office (%1 x3)").arg(month)
                value: month * 3
            }

            KeyValue {
                key: qsTr("For staying alive")
                value: "10"
                visible: alive
            }

            KeyValue {
                key: qsTr("For moneygrabbing (%1,000 /10,000)").arg(swiss)
                value: Math.floor(swiss / 10)
                visible: alive
            }

            Divider {}

            KeyValue {
                key: qsTr("Your total")
                value: total
            }

            Divider {}

            KeyValue {
                key: qsTr("Highest Score so far is")
                value: history
            }

            Divider {}

            ButtonOk {
                text: qsTr("Final")
                onClicked: onAction({})
            }
        }
    }
}
