import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.15
import "script.js" as Script

GroupBox {
    id: consoleArea
    title: "Console area"
//    anchors.fill: parent
    Flickable {
        id: flick
        anchors.fill: parent
        TextArea.flickable: TextArea {
            id: content
            background: Rectangle {
                anchors.fill: parent
            }
            selectByMouse: true

            wrapMode: TextArea.Wrap
        }

        ScrollBar.vertical: ScrollBar { }

        Connections {
            target: Process
            function onSigCommandResult(result) {
                console.log("onSigCommandResult")
                Script.addText(result)
            }
        }
    }
}



