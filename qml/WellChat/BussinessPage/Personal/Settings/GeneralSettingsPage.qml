import Resource 1.0 as R

import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import Sparrow 1.0

import "../../../Component"

Page {
    id: generalSettingsPage
    title: qsTr("General")
    color: "#ccc"

    focus: true
    Keys.onBackPressed: {
        event.accepted = true;
        try { stackView.pop(); }  catch(e) { }
    }

    Constant {  id: constant  }

    topBar: TopBar {
        id: topBar
//        //! aviod looping binding
//        Item { anchors.fill: parent }
        RowLayout {
            anchors.fill: parent
            spacing: 10

            Item { width:  topBar.height - 2; height: width }

            SampleIcon {
                iconSource: R.R.activeIconBack
                iconSize: Qt.size( topBar.height - 2,  topBar.height - 2)
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    try { stackView.pop(); }  catch(e) { }
                }

                Separator {
                    color: "black"
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        // such as menuBar

        Row {
            parent: topBar
            anchors.left: parent.left
            anchors.leftMargin: (topBar.height - 2) * 1.5
            anchors.fill: parent
            Label {
                text: generalSettingsPage.title
                // Layout.alignment: Qt.AlignRight
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                font.family: GeneralSettings.generalfontFamily
                font.pointSize: constant.middleFontPointSize
            }
        }
    }

    ScrollView {
        id: page
        anchors.fill: parent

        verticalScrollBarPolicy :Qt.ScrollBarAlwaysOff
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff

        Item {
            id: content
            width: page.width
            height: Math.max(page.viewport.height, column.implicitHeight + 2 * column.spacing)

            ColumnLayout {
                id: column
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: 20

                Item {  width: parent.spacing;  height: parent.height }

                SettingsGroup {
                    Layout.fillWidth: true

                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("Landscape Display")
                            Switch {
                                checked: true
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.rightMargin: column.spacing
                            }
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("Low-bitrate Recording")
                            Switch {
                                checked: true
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.rightMargin: column.spacing
                            }
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("Low-bitrate Recording")
                            Label {
                                text: qsTr("3G / 4G and Wi-Fi")
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.rightMargin: column.spacing
                                color: "#666"
                                font.family: GeneralSettings.generalfontFamily
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                font.pointSize: constant.smallFontPointSize + 2
                            }
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("Auto-Update WellChat")
                            Label {
                                text: qsTr("Never")
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.rightMargin: column.spacing
                                color: "#666"
                                font.family: GeneralSettings.generalfontFamily
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                font.pointSize: constant.smallFontPointSize + 2
                            }
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("Language")
                            Label {
                                text: qsTr("English")
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.rightMargin: column.spacing
                                color: "#666"
                                font.family: GeneralSettings.generalfontFamily
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                font.pointSize: constant.smallFontPointSize + 2
                            }
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("Font Size")
                            Label {
                                text: qsTr("Standard")
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.rightMargin: column.spacing
                                color: "#666"
                                font.family: GeneralSettings.generalfontFamily
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                                font.pointSize: constant.smallFontPointSize + 2
                            }
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("Features")
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("Data Usage")
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("Web WellChat")
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("Manage Storage")
                        }
                } // First Settings Group
            } // Main ColumnLayout
        } // content
    } // ScrollView
}
