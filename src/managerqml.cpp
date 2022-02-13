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
    PROCESS->runCommand(command);
}

void ManagerQML::buidApp(QString appName)
{
    qDebug() << "ManagerQML::buidApp " << appName;

}

void ManagerQML::pullRPM(QString appName)
{

}
