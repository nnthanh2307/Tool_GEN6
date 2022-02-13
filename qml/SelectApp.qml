import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.15
import "../js/script.js" as Script

Rectangle {
    id: selectApp
    width: parent.width
    GroupBox {
        id: groups
        title: "Select Application"
        width: parent.width - 20
        anchors.leftMargin: 10
        anchors.left: parent.left
        RowLayout {
            spacing: 10
            anchors.verticalCenter: parent.verticalCenter
            Repeater {
                model: listApp.length
                RadioButton {
                    id: radio
                    text: listApp[index]
                    onClicked: {
                        console.log("selected: " + listApp[index]);
                        Script.setAppSelected(index)
                    }
                }
            }

            TextField {
                id: textField
                signal keyPressed()
                placeholderText: qsTr("Enter application name")
                cursorVisible: true
                enabled: false
                background: Rectangle {
                    implicitWidth: 500
                    implicitHeight: 40
                    color: textField.enabled ? "transparent" : "#353637"
                    border.color: textField.enabled ? "#21be2b" : "transparent"
                }
                Keys.onReleased:  {
                    textField.keyPressed()
                }
            }
        }
    }


    Connections {
        target: textField
        function onKeyPressed() {
            appSelected = textField.text
//            console.log(appSelected)
        }
    }
}
