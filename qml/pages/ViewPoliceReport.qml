import QtQuick 2.0
import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    property bool available
    property int treasury
    property int popularity
    property int strength
    property int minimal
    property var onAction

    SilicaListView {
        anchors.fill: parent

        VerticalScrollDecorator {}

        Column {
            id: container
            spacing: Theme.paddingLarge
            anchors.fill: parent

            HeaderComponent { key: "report" }

            Loader {
                id: reportLoader
                width: parent.width
                anchors.centerIn: container
            }

            Component.onCompleted: {
                reportLoader.sourceComponent = available ? report : noReport;
            }

            Component {
                id: noReport
                Column {
                    spacing: Theme.paddingLarge

                    Label {
                        text: qsTr("Not available")
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: Theme.fontSizeExtraLarge
                    }

                    Divider {}

                    KeyValue {
                        key: qsTr("Your popularity with us is")
                        value: popularity
                        visible: popularity <= minimal
                    }

                    KeyValue {
                        key: qsTr("Police strength is")
                        value: strength
                        visible: strength <= minimal
                    }

                    Text {
                        text: qsTr("You can't afford a report")
                        visible: treasury < 1
                        color: Theme.primaryColor
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: Theme.fontSizeMedium
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Divider {}

                    ButtonOk {
                        onClicked: onAction({ viewReport: false })
                    }
                }
            }


            Component {
                id: report
                Column {
                    spacing: Theme.paddingLarge
                    width: parent.width

                    Text {
                        text: qsTr("Cost 1,000")
                        horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: Theme.fontSizeLarge
                        color: Theme.primaryColor
                    }

                    Divider { }

                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter

                        spacing: Theme.paddingLarge

                        Button {
                            id: passButton
                            text: qsTr("Request report")
                            enabled: available
                            onClicked: onAction({ viewReport: true })
                        }

                        Button {
                            text: qsTr("No need report")
                            onClicked: onAction({ viewReport: false })
                        }
                    }
                }
            }
        }
    }
}
