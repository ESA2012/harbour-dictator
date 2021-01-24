#include "gameservice.h"

#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QCryptographicHash>

GameService::GameService(QObject *parent) : QObject(parent)
{
    QString path = QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation);
    this->pHistDir = new QDir(path);
    this->pHistFile = new QFile(pHistDir->absoluteFilePath("history.json"));
}

GameService::~GameService()
{
    delete this->pHistDir;
    delete this->pHistFile;
}

void GameService::saveHistory(int history) {
    if (!this->pHistDir->exists() && !this->pHistDir->mkpath(this->pHistDir->absolutePath())) {
        qWarning("Couldn't create directory");
        return;
    }

    if (!this->pHistFile->open(QIODevice::WriteOnly)) {
        qWarning("Couldn't create history file");
        return;
    }

    QJsonObject data;
    data["history"] = history;
    data["crc"] = getHashForHistory(history);

    QJsonDocument historyJson(data);

    this->pHistFile->write(historyJson.toJson());

    this->pHistFile->close();
}


int GameService::loadHistory()
{
    if (!this->pHistFile->open(QIODevice::ReadOnly)) {
        qWarning("Couldn't open history file");
        return 0;
    }

    QByteArray saveData = this->pHistFile->readAll();

    this->pHistFile->close();

    QJsonDocument jsonHistory(QJsonDocument::fromJson(saveData));

    QJsonObject data = jsonHistory.object();

    int history = data["history"].toInt();
    QString crc = data["crc"].toString();

    if (crc != getHashForHistory(history)) {
        qWarning("Incorrect history value");
        return 0;
    }

    return history;
}

QString GameService::getHashForHistory(int history)
{
    QCryptographicHash hash(QCryptographicHash::Sha256);
    hash.addData((QString::number(history)).toUtf8());
    return QString(hash.result().toHex());
}

QString GameService::getVersion()
{
    return QString(APP_VERSION);
}
