#include "managerqml.h"

ManagerQML::ManagerQML()
{

}

ManagerQML* ManagerQML::getInstance()
{
    static ManagerQML instance;
    return &instance;
}

void ManagerQML::buildApp(QString devUser, QString appName)
{
    qDebug() << "ManagerQML::buidApp " << appName;
    PROCESS->buildApp(devUser, appName);

}
