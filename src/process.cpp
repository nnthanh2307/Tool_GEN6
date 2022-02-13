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
    qProcess.start("bash", QStringList() << "-c" << "cat /home/ngocthanh/cv_debug.log");
    qProcess.waitForFinished(-1);
//    qProcess.execute("bash", QStringList() << "-c" << "ls /home/");
   QString result = qProcess.readAllStandardOutput();
   qDebug() << result;
   emit sigCommandResult(result);
}
