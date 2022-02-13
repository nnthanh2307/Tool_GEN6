import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.1
import "../js/script.js" as Script

Item {
    id: name
    Row {
        Button {
            text: "Build Application"
            onClicked: {
                ManagerQML.runCommand(appSelected)
//                ManagerQML.runCommand("ping 192.168.1.1")
            }
        }

        Button {
            text: "Pull RPM"
            onClicked: {
                //                ManagerQML.runCommand("ls /home/")
            }
        }

        Button {
            text: "Push Code to Build"
            onClicked: {
                //                ManagerQML.runCommand("ls /home/")
            }
        }

        Button {
            text: "Clear Log"
            onClicked: {
               ManagerQML.clearLog()
            }
        }

    }




}
