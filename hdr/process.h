#ifndef PROCESS_H
#define PROCESS_H

#include <QObject>
#include <QProcess>
#include <QDebug>

class Process : public QObject
{
    Q_OBJECT
public:
    static Process* getInstance();
    void runCommand(QString command);
    void execute(QString command);
signals:
    void sigCommandResult(QString result);
public slots:
    void receiveMessage();
private:
    Process();
    QProcess qProcess;
};
#define PROCESS Process::getInstance()
#endif // PROCESS_H
