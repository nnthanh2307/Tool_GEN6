#include "process.h"

Process::Process()
{

}

Process *Process::getInstance()
{
    static Process process;
    return &process;
}

void Process::runCommand(QString command)
{
    this->execute(command);
}

void Process::execute(QString command)
{
    qDebug() << "run command";
    qProcess.setWorkingDirectory("/bin/");
    qProcess.start("bash", QStringList() << "-c" << command);
//    qProcess.waitForStarted();
   connect( &qProcess, SIGNAL(readyReadStandardOutput()), this, SLOT(receiveMessage()));
//   qProcess.waitForFinished();
}

void Process::receiveMessage()
{
    QString result = qProcess.readAllStandardOutput();
//    qDebug() << result;
    emit sigCommandResult(result);
}
