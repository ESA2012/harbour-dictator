#ifndef GAMESERVICE_H
#define GAMESERVICE_H

#include <QStandardPaths>
#include <QObject>
#include <QString>
#include <QDir>
#include <QFile>
#include <QPointer>

class GameService : public QObject
{
    Q_OBJECT
public:
    explicit GameService(QObject *parent = 0);
    ~GameService();
    Q_INVOKABLE void saveHistory(int history);
    Q_INVOKABLE int loadHistory();

private:
    QString getHashForHistory(int history);
    QDir * pHistDir;
    QFile * pHistFile;
};

#endif // GAMESERVICE_H
