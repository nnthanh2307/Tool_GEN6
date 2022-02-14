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
                if (appSelected == "" || devUser == "") {
                    message.text = "Please select app to build!"
                    message.open()
                } else {
                    ManagerQML.buildApp(devUser, appSelected)
                }
            }
        }

        Button {
            text: "Download RPM"
            onClicked: {
                console.log("click Download: "+ downloadPath)
                if (downloadPath == "" || devUser == "" || appSelected == "") {
                    if(downloadPath == "")
                        message.text = "Download path is empty!"
                    else
                        message.text = "Developer user is empty!"
                    message.open()
                } else {
                    Process.downloadRPM(devUser, appSelected)
                }

            }
        }

        Button {
            text: "Push Code to Build"
            onClicked: {
                console.log("click Download: "+ downloadPath)
                if (sourcePath == "" || devUser == "") {
                    if(sourcePath == "")
                        message.text = "Source path is empty!"
                    else
                        message.text = "Developer user is empty!"
                    message.open()
                } else {
                    //                    Process.downloadRPM(devUser, appSelected)
                }
            }
        }

        Button {
            text: "Flash RPM"
            onClicked: {
                if (downloadPath == "" || devUser == "" || appSelected == "") {
                    message.text = "Source path, Developer user or Download path is empty!"
                    message.open()
                } else {
                    Process.flashRPM(devUser, appSelected)
                }
            }
        }

        Button {
            text: "Clear Log"
            onClicked: {
                ManagerQML.clearLog()
            }
        }

    }

    MessageDialog {
        id: message
        buttons: MessageDialog.Ok
    }
}
