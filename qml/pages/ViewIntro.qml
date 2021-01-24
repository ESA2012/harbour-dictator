import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    property var onAction

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("About...")
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("ViewAbout.qml"))
                }
            }
        }

        ShaderEffectSource {
            id: theSource
            sourceItem: Image {
                source: Qt.resolvedUrl("qrc:/assets/Flag1.png")
                width: sourceSize.width
                height: sourceSize.height
            }
        }

        ShaderEffect {
            id: flag
            width: parent.width - Theme.horizontalPageMargin * 2
            height: width / 1.6666666
            anchors.centerIn: parent
            property variant source: theSource
            property real frequency: 10
            property real amplitude: 0.03
            property real time: 0.0
            NumberAnimation on time {
                from: 0; to: Math.PI*2; duration: 10000; loops: Animation.Infinite
            }
            fragmentShader: "
                varying highp vec2 qt_TexCoord0;
                uniform sampler2D source;
                uniform lowp float qt_Opacity;
                uniform highp float frequency;
                uniform highp float amplitude;
                uniform highp float time;

                void main()
                {
                    highp vec2 texCoord = qt_TexCoord0;
                    texCoord.y = amplitude * sin(time * frequency + texCoord.x * 6.283185) + texCoord.y;
                    gl_FragColor = texture2D(source, texCoord) * qt_Opacity;
                }"
        }


        Label {
            id: repText
            font.pixelSize: Theme.fontSizeExtraLarge
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: Theme.paddingLarge
            anchors.bottom: flag.top
            text: qsTr("REPUBLICA")
        }

        OpacityRampEffect {
            sourceItem: repText
            direction: OpacityRamp.TopToBottom
        }

        Label {
            id: ritText
            font.pixelSize: Theme.fontSizeExtraLarge
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: flag.bottom
            anchors.topMargin: Theme.paddingLarge
            text: qsTr("RITIMBA")
        }

        OpacityRampEffect {
            sourceItem: ritText
            direction: OpacityRamp.TopToBottom
        }


        ButtonOk {
            text: qsTr("Press to become a <b>Dictator</b>")
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: Theme.paddingLarge
            onClicked: onAction()
        }
    }
}
