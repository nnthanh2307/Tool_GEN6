import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.15
import "script.js" as Script

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


}


