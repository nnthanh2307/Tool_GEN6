#include "process.h"

Process::Process()
{

}

Process *Process::getInstance()
{
    static Process process;
    return &process;
}

void Process::runScript(QString file)
{
    qDebug() << "run Script: file name => " << file;
    QString run = "python3 " + scriptPath  + " " + userName + " " + appName + " " + sourcePath + " " + downloadPath + " " + action ;
    qDebug() << run;
    qProcess.setWorkingDirectory("/bin/");
    qProcess.start("bash", QStringList() << "-c" << run);

    connect( &qProcess, SIGNAL(readyReadStandardOutput()), this, SLOT(receiveMessage()));
    connect( &qProcess, SIGNAL(readyReadStandardError()), this, SLOT(receiveError()));
}

void Process::buildApp(QString devUser, QString appName)
{
    QString scriptPath = QDir::currentPath() + "/Script/" + "run.py";
    this->appName = appName;
    this->userName = devUser;
    this->downloadPath = "empty";
    this->sourcePath = "empty";
    this->action = "build";
    this->runScript("run.py");
}

void Process::downloadRPM(QString devUser, QString appName)
{
    qDebug() << "Process::downloadRPM " << devUser << " " << appName;
    this->userName = devUser;
    this->appName = appName;
    this->action = "download";
    this->sourcePath = "empty";
    this->runScript("run.py");
}

void Process::flashRPM(QString devUser, QString appName)
{
    qDebug() << "Process::flashRPM " << devUser << " " << appName;
    this->userName = devUser;
    this->appName = appName;
    this->action = "flash";
    this->sourcePath = "empty";
    this->runScript("run.py");
}

void Process::setSourcePath(QString path)
{
    qDebug() << "Process::setSourcePath";
    this->sourcePath = path;
}

void Process::setDownloadPath(QString path)
{
    qDebug() << "Process::setDownloadPath";
    this->downloadPath = path;
}

void Process::printParam()
{
    qDebug() << "print Param:";
    qDebug() << appName;
    qDebug() << userName;
    qDebug() << downloadPath;
    qDebug() << sourcePath;
    qDebug() << action;
}

void Process::receiveMessage()
{
    QString output = qProcess.readAllStandardOutput();
    emit sigCommandResult(output);
}

void Process::receiveError()
{
    qDebug() << "Process::receiveError";
    QString error = qProcess.readAllStandardOutput();
    qDebug() << error;
}
