import QtQuick 2.6
import Sailfish.Silica 1.0

Page {
    property var onAction
    property var revolutionResult

    HeaderComponent {
        key: "revEscape"
    }

    SilicaListView {
        id: resultListView
        anchors.centerIn: parent
        width: parent.width - Theme.paddingLarge * 2

        model: ListModel {
            id: escapeListModel
        }
        spacing: Theme.paddingSmall
        height: contentHeight
        delegate: Text {
            text: escapeItem
            wrapMode: Text.WordWrap
            color: Theme.primaryColor
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            width: parent.width
            font.pixelSize: Theme.fontSizeExtraLarge
            height: contentHeight + Theme.paddingSmall * 2
        }

        FillBackground {
            color: "red"
        }
    }

    ButtonOk {
        onClicked: onAction({})
        anchors {
            bottom: parent.bottom
            bottomMargin: Theme.paddingLarge
        }
    }

    QtObject {
        id: texts
        readonly property string helicopter_escape: qsTr("You escape by helicopter!")
        readonly property string helicopter_broke: qsTr("The helicopter won't start!")
        readonly property string leftoto_escape: qsTr("You have to get through the mountains to Leftoto")
        readonly property string guerillas_catch: qsTr("The guerillas are celebrating")
        readonly property string guerillas_no_catch: qsTr("The guerillas didn't catch you")

        readonly property string you: qsTr("You have been")
        readonly property string overthrown: qsTr("overthrown")
        readonly property string liquidated: qsTr("liquidated")
        readonly property string and: qsTr("and")
    }

    Component.onCompleted: {
        for (var i = 0; i < revolutionResult.length; i++) {
            var res = revolutionResult[i];
            if (res) {
                escapeListModel.append({ escapeItem: texts[res] });
            }
        }
    }
}
