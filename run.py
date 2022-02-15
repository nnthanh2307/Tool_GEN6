import sys
import paramiko
import glob
import os


#config Developer
DEV_USER = sys.argv[1]
APP_NAME = sys.argv[2]
DOWNLOAD_SOURCE = sys.argv[4]
SOURCE_PATH = sys.argv[3]
ACTION = sys.argv[5]

#config server build
SERVER_IP = "192.168.1.13"
SERVER_USER = "ubuntu"
SERVER_PASS = "ngocthanh"

#config test bench
BENCH_IP = "192.168.105.100"
BENCH_USER = "root"
BENCH_RPM_DIR = "/home/root/work/" + DEV_USER + "/"
BENCH_PASS = ""
MOUNT_COMMAND = "mount -o remount, rw /"
INSTALL_RPM = "rpm -ivh --force --nodeps "
REBOOT_COMMAND = "reboot"

DOWNLOAD_PATH = DOWNLOAD_SOURCE
REMOTE_RPM_PATH = "/data001/" + DEV_USER + "/build-coconut/BUILD/deploy/rpm/aarch64/"

DOWNLOAD_PATH = "/home/ngocthanh/Desktop/Download/"
REMOTE_RPM_PATH = "/home/ubuntu/Developer/"

class Connection:
    def __init__(self, ip, username, password):
        print("Connection::__init__", ip, username, password)
        try:
            self.ssh = ssh = paramiko.SSHClient()
            self.ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            self.ssh.connect(ip,
                username = username,
                password = password,
                look_for_keys = False, timeout = 2)
        except Exception as e:
            print ("Connect error ", e)
        pass

    def downloadFile(self, fileName, localPath):
        print ("Connection::downloadFile")
        sftp = self.ssh.open_sftp()
        try:
            remoteFile = BENCH_RPM_DIR + fileName
            localFile = DOWNLOAD_PATH + fileName
            # self.printConsole(remoteFile + localFile)
            sftp.get(remoteFile, localFile)
            sftp.close()
        except Exception as e:
            sftp.close()
            print ("Download error: ", e)
            sys.exit()
        pass

    def downLoadRPM(self, appName):
        print ("connection::donwloadRPM")
        cmd = "find " + REMOTE_RPM_PATH + " -iname " + "\"" + appName + "-*.rpm"  + "\""
        print(cmd)
        result = self.runCommand(cmd)
        # self.printConsole(result)
        for item in result.readlines():
            self.downloadFile(item.rstrip(), DOWNLOAD_PATH)
        self.closeConnect()
        pass


    def uploadFile(self, fileName, localPath):
        print ("Connection::uploadFile")
        try:
            sftp = self.ssh.open_sftp()
            remoteFile = REMOTE_RPM_PATH + fileName
            localFile = DOWNLOAD_PATH + fileName
            sftp.put(localFile, remoteFile)
            sftp.close()
            pass
        except Exception as e:
            sftp.close()
            print ("Upload error: ", e)
            sys.exit()

        pass

    def runCommand(self, command):
        print("Connection::runCommand => ", command)
        (ssh_stdin, ssh_stdout, ssh_stderr) = self.ssh.exec_command(command)
        exit_status = ssh_stdout.channel.recv_exit_status()
        return ssh_stdout
        pass

    def printConsole(self, result):
        for line in result.readlines():
            print(line.rstrip())
        pass

    def closeConnect(self):
        self.ssh.close()
        pass

class Process:
    def __init__(self):
        # print ("Process::__init__")
        pass
    
    def buildRPM(self, appName):
        print ("Process::buildRPM")
        self.connect = Connection(SERVER_IP, SERVER_USER, SERVER_PASS)
        cmd = "cd /data001/"+ DEV_USER + "/build-cocconut;" + ". oe-init-build-env;" + "bitbake " + APP_NAME
        # print (cmd)
        result = self.connect.runCommand(cmd)
        self.connect.printConsole(result)
        pass

    def download(self, appName):
        print ("Process::download")
        self.connect = Connection(SERVER_IP, SERVER_USER, SERVER_PASS)
        self.connect.downLoadRPM(APP_NAME)
        self.connect.closeConnect()
        pass

    def flashRPM(self, appName):
        print ("Process::flashRPM")

        #BENCH
        self.connect = Connection(BENCH_IP, BENCH_USER, BENCH_PASS)
        print ("Push file to test bench.....")
        self.pushToBench()
        print ("===== Flashing =====")
        cmdFlash = "cd " + BENCH_RPM_DIR + "; " + MOUNT_COMMAND + "; " + INSTALL_RPM + APP_NAME + "-*.rpm"
        # print(cmdFlash)
        flashResult = self.connect.runCommand(cmdFlash)
        self.connect.printConsole(flashResult)
        pass
    
    def pushToBench(self):
        # print ("Process::pushtoBench")
        os.chdir(DOWNLOAD_PATH)
        listFile = glob.glob("*.txt")
        for item in listFile:
            self.connect.uploadFile(item, DOWNLOAD_PATH)
            print (item, "is pushing...")
        pass

    def run(self, action):
        print ("Process::run ==> action = ", action)
        if (action == "build"):
            self.buildRPM(APP_NAME)
        elif (action == "download"):
            self.download(APP_NAME)
        elif (action == "flash"):
            self.flashRPM(APP_NAME)
        pass

if __name__ == "__main__":

    process = Process()
    process.run(ACTION)
    del process

