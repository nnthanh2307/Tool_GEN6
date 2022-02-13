import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.15
import "script.js" as Script

ApplicationWindow {
    width: 1280
    height: 800
    visible: true
    title: qsTr("HKMC-GEN6 Tools Ngoc Thanh LGE")

    property var listApp: ["Android Auto", "Android Auto Service", "CarPlay", "CarPlay Service", "Other App"]
    property var appSelected: ""
    property var systemMargin: 10
    property var sourcePath: ""
    property var downloadPath: ""

    Rectangle {
        id: col
        anchors.fill: parent
        anchors.margins: systemMargin
        radius: 10

        OptionsArea {
            id: opt
            width: parent.width
            height: 300
        }

        Console {
            id: consoleArea
            width: parent.width
            height: 400
            anchors.top: opt.bottom
        }

        ListButton {
            id: listButton
            anchors.bottomMargin: 30
            anchors.bottom: consoleArea.top
        }
    }
}
