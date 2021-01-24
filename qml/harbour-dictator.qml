import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

import "pages/jsDictator.js" as DictatorGame;

import net.snk 1.0

ApplicationWindow
{

    initialPage: Component {
        ViewIntro {
            onAction: DictatorGame.nextStep
        }
    }

    cover: Qt.resolvedUrl("cover/CoverPage.qml", {})


    allowedOrientations: defaultAllowedOrientations

    Component.onCompleted: {
        DictatorGame.initialize(pageStack, GameService)
    }
}
