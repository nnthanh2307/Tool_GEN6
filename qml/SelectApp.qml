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
                id: textField1
                signal keyPressed()
                placeholderText: qsTr("Enter application name")
                cursorVisible: true
                enabled: false
                background: Rectangle {
                    implicitWidth: 300
                    implicitHeight: 40
                    color: textField1.enabled ? "transparent" : "#353637"
                    border.color: textField1.enabled ? "#21be2b" : "transparent"
                }
                Keys.onReleased:  {
                    textField1.keyPressed()
                }
            }

            TextField {
                id: developerUser
                signal keyPressed()
                placeholderText: qsTr("Developer User")
                cursorVisible: true
                background: Rectangle {
                    implicitWidth: 220
                    implicitHeight: 40
                    color: developerUser.enabled ? "transparent" : "#353637"
                    border.color: developerUser.enabled ? "#21be2b" : "transparent"
                }
                Keys.onReleased:  {
                    developerUser.keyPressed()
                }
            }
        }
    }


    Connections {
        target: textField1
        function onKeyPressed() {
            appSelected = textField1.text
        }
    }

    Connections {
        target: developerUser
        function onKeyPressed() {
            devUser = developerUser.text
        }
    }
}
