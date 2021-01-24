import QtQuick 2.0
import Sailfish.Silica 1.0

Button {
    id: btn
    text: qsTr("Ok")
    anchors.horizontalCenter: parent.horizontalCenter
    color: "#ff0000"
    state: "red"

    Timer {
        id: tmr
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            btn.state = btn.state === "red" ? "blue" : "red"
        }
    }

    states: [
        State {
            name: "blue"
            PropertyChanges { target: btn; color: "#3333FF" }
        },
        State {
            name: "red"
            PropertyChanges { target: btn; color: "#FF3333" }
        }
    ]
}
