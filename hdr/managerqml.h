#ifndef MANAGERQML_H
#define MANAGERQML_H

#include <QObject>
#include <QtDebug>
#include "process.h"

class ManagerQML : public QObject
{
    Q_OBJECT
private:
    ManagerQML();
public:    
    static ManagerQML* getInstance();
    Q_INVOKABLE void runCommand(QString command);
    Q_INVOKABLE void runScript(QString file, QString command);
    Q_INVOKABLE void buildApp(QString devUser, QString appName);
    Q_INVOKABLE void downloadRPM(QString devUser, QString appName);

signals:
    void clearLog();
};

#define MANAGERQML ManagerQML::getInstance()
#endif // MANAGERQML_H
