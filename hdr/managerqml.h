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
    Q_INVOKABLE void buidApp(QString appName);
    Q_INVOKABLE void pullRPM(QString appName);
signals:
    void clearLog();
};

#define MANAGERQML ManagerQML::getInstance()
#endif // MANAGERQML_H
