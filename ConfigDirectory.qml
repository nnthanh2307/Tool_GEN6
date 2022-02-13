import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.1

import "script.js" as Script

Rectangle {
    id: configDirectory
    width: parent.width
    GroupBox {
        title: "Set source code and download path"
        anchors.fill: parent
        GridLayout {
            rows: 2
            flow: GridLayout.TopToBottom

            Label { text: "Source: " }
            Label { text: "Download: " }
            CustomText {
                id: sourceP
                placeholderText: qsTr("Enter source directory")
            }

            CustomText {
                id:downloadP
                placeholderText: qsTr("Enter download directory")
            }

            Button {
                id: sourceButton
                text: "Open"
                onClicked: {
                    sourceDialog.open()
                }
            }

            Button {
                id: downloadButton
                text: "Open"
                onClicked: {
                    downloadDialog.open()
                }
            }

            TextArea {
                text: "This widget spans over three rows in the GridLayout.\n"
                    + "All items in the GridLayout are implicitly positioned from top to bottom."
                wrapMode: TextArea.WordWrap
                Layout.rowSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.minimumHeight: implicitHeight
                Layout.minimumWidth: 100     // guesstimate, should be size of largest word
            }

        }
    }

    FolderDialog {
        id: sourceDialog
        folder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        onAccepted: {
            sourcePath = Script.setPath(sourceDialog.folder.toString())
            sourceP.text = sourcePath
        }
    }

    FolderDialog {
        id: downloadDialog
        folder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        onAccepted: {
            downloadPath = Script.setPath(downloadDialog.folder.toString())
            downloadP.text = downloadPath
        }
    }
}
