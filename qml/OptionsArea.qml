import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.15
import "../js/script.js" as Script

Rectangle {
    id: optionArea
    y: 20

    SelectApp {
        id: selectApp
        height: 100
    }

    ConfigDirectory {
        id: directory
        height: 150
        anchors.top: selectApp.bottom
    }

    Connections {
        target: directory
        function onChangeDownloadPath(path) {
            downloadPath = path
            Process.setDownloadPath(downloadPath)
        }
    }

    Connections {
        target: directory
        function onChangeSourcePath(path) {
            sourcePath = path
            Process.setSourcePath(downloadPath)
        }
    }

}
