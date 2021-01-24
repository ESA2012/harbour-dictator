#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>
#include <QtQml>
#include <src/gameservice.h>

int main(int argc, char *argv[])
{
    qmlRegisterType<GameService>("net.snk", 1, 0, "GameService");

    return SailfishApp::main(argc, argv);
}
