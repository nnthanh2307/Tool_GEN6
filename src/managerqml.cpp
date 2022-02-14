#include "managerqml.h"

ManagerQML::ManagerQML()
{

}

ManagerQML* ManagerQML::getInstance()
{
    static ManagerQML instance;
    return &instance;
}

void ManagerQML::runCommand(QString command)
{
    qDebug() << "ManagerQML::runCommand() " << command;
//    PROCESS->runCommand(command);
//    PROCESS->runScript(command);
}

void ManagerQML::runScript(QString file, QString command)
{
    qDebug() << "ManagerQML::runScript(): file:" << file << " command:" << command;
//    PROCESS->runScript(file, command);
}

void ManagerQML::buildApp(QString devUser, QString appName)
{
    qDebug() << "ManagerQML::buidApp " << appName;
    PROCESS->buildApp(devUser, appName);

}

void ManagerQML::downloadRPM(QString devUser, QString appName)
{
    qDebug() << "ManagerQML::downloadRPM ";
    PROCESS->downloadRPM(devUser, appName);

}
