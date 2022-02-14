#ifndef PROCESS_H
#define PROCESS_H

#include <QObject>
#include <QProcess>
#include <QDebug>
#include <QDir>

class Process : public QObject
{
    Q_OBJECT
public:
    static Process* getInstance();
    void runScript(QString file);
    void buildApp(QString devUser, QString appName);
    Q_INVOKABLE void downloadRPM(QString devUser, QString appName);
    Q_INVOKABLE void setSourcePath(QString path);
    Q_INVOKABLE void setDownloadPath(QString path);


    void printParam();
signals:
    void sigCommandResult(QString result);
public slots:
    void receiveMessage();
    void receiveError();
private:
    Process();

    QString scriptPath = QDir::currentPath() + "/Script/run.py";
    QProcess qProcess;
    QString userName = "";
    QString appName = "";
    QString sourcePath = "";
    QString downloadPath = "";
    QString action = "";
};
#define PROCESS Process::getInstance()
#endif // PROCESS_H
