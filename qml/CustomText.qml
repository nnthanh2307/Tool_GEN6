import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.15
import "../js/script.js" as Script

TextField {
    id: textField
    signal keyPressed
    readOnly: true
    placeholderText: qsTr("Enter application name")
//    enabled: false
    background: Rectangle {
        implicitWidth: 500
        implicitHeight: 40
        color: textField.enabled ? "transparent" : "#353637"
        border.color: textField.enabled ? "#21be2b" : "transparent"
    }
    Keys.onReleased: keyPressed()
}
