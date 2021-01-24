#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>
#include <QtQml>
#include <src/gameservice.h>

int main(int argc, char *argv[])
{
//    qmlRegisterType<GameService>("net.snk", 1, 0, "GameService");
    qmlRegisterSingletonType<GameService>("net.snk", 1, 0, "GameService", [](QQmlEngine *engine, QJSEngine *scriptEngine) -> QObject * {
        Q_UNUSED(engine)
        Q_UNUSED(scriptEngine)
        GameService *gs = new GameService();
        return gs;
    });

    return SailfishApp::main(argc, argv);
}
