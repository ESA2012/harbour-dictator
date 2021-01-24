import QtQuick 2.6
import Sailfish.Silica 1.0


Page {
    property var onAction

    SilicaFlickable {
        anchors.fill: parent

        HeaderComponent {
            key: "bankrupt"
        }

        Text {
            text: qsTr("The treasury is bankrupt!<br/>Your popularity with the Army & the Secret Police will drop!<br/>Police strength will drop and your own strength will drop")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: Theme.fontSizeMedium
            color: Theme.primaryColor
            width: parent.width - Theme.horizontalPageMargin * 2
            height: contentHeight + Theme.paddingMedium * 2
            anchors.centerIn: parent
            font.bold: true
            anchors.margins: {
                left: Theme.paddingLarge
                right: Theme.paddingLarge
            }
            wrapMode: Text.WordWrap

            FillBackground {
                color: "orange"
            }
        }

        ButtonOk {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Theme.paddingLarge
            onClicked: onAction({})
        }
    }
}
