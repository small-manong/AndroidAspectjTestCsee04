import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import Sparrow 1.0

import "../Component"

Page {
    id: profilePage
    title: qsTr("Profile") // 个人简介页面
    color: "#ebebeb"

    Constant {  id: constant  }

    focus: true
    Keys.onBackPressed: {
        event.accepted = true;
        try { stackView.pop(); }  catch(e) { }
    }

    topBar: TopBar {
        id: topBar
//        //! aviod looping binding
//        Item { anchors.fill: parent }
        RowLayout {
            anchors.fill: parent
            spacing: 10

            Item { width:  topBar.height - 2; height: width }

            SampleIcon {
                iconSource: constant.backActiveIcon
                height: topBar.height - 2
                width: topBar.height - 2
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    try { stackView.pop(); }  catch(e) { }
                }

                Separator {
                    color: "black"
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                }

                //! [0] fix the bug
                // 在本页面压入一个页面之后再弹出
                // x 的值会变成 180
                // 需要将其设置回 0
                onXChanged: {
                    if(x != 0 ) {
                        x = 0
                    }
                }
                //! [0] fix the bug
            }
        }
        // such as menuBar

        Row {
            parent: topBar
            anchors.left: parent.left
            anchors.leftMargin: (topBar.height - 2) * 1.5
            anchors.fill: parent
            SampleLabel {
                text: profilePage.title
                // Layout.alignment: Qt.AlignRight
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
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
            //width: Math.max(page.viewport.width, column.implicitWidth + 2 * column.spacing)
            height: Math.max(page.viewport.height, column.implicitHeight + 2 * column.spacing)

            ColumnLayout {
                id: column
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: 20

                Item {  width: parent.spacing;  height: parent.height }

                Rectangle {
                    Layout.fillWidth: true
                    height: rowLayout1.height + 10

                    RowLayout {
                        id: rowLayout1
                        width: parent.width
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 10

                        Item {  width: parent.spacing;  height: parent.height }

                        Image {
                            height: column1.height * 1.2
                            width: column1.height * 1.2
                            sourceSize: Qt.size(width, height)
                            source: constant.testPic
                        }

                        ColumnLayout {
                            id: column1
                            Layout.fillHeight: true
                            Row {
                                spacing: 10
                                SampleLabel {
                                    id: personName
                                    text: "小屁孩"
                                }
                                Image {
                                    height: personName.height
                                    width: personName.height
                                    sourceSize: Qt.size(width, height)
                                    source: constant.maleSampleIcon
                                }
                            }
                            SampleLabel {
                                id: showId
                                text: qsTr("ID: qyvlik")
                                color: "#888"
                            }
                            SampleLabel {
                                id: showNick
                                text: "昵称: qyvlik"
                                color: "#888"
                            }
                        }

                        Item { Layout.fillWidth: true }

                    } // rowLayout1
                } // colmnLayout1Parent

                Rectangle {
                    Layout.fillWidth: true
                    height: columnLayout2.height
                    color: "white"
                    ColumnLayout {
                        id: columnLayout2
                        width: parent.width
                        spacing: 0

                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("Region")
                            Label {
                                text: qsTr("Guangdong Shantou")
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.rightMargin: column.spacing
                                color: "#666"
                                font.family: GeneralSettings.generalfontFamily
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            }
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("What's Up")
                            Label {
                                text: "逝水流年"
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.rightMargin: column.spacing
                                color: "#666"
                                font.family: GeneralSettings.generalfontFamily
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            }
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        IconLabel {
                            // 相册
                            Layout.fillWidth: true
                            labelText:  qsTr("Album")

                            Row {
                                id: row1
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                anchors.rightMargin: 10
                                height: parent.height
                                spacing: 5
                                Image {
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.height * 0.8
                                    height: parent.height * 0.8
                                    sourceSize: Qt.size(width, height)
                                    source: constant.testPic
                                }
                                Image {
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.height * 0.8
                                    height: parent.height * 0.8
                                    sourceSize: Qt.size(width, height)
                                    source: constant.testPic
                                }
                                Image {
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.height * 0.8
                                    height: parent.height * 0.8
                                    sourceSize: Qt.size(width, height)
                                    source: constant.testPic
                                }
                            }
                        }

                        Separator {
                            Layout.fillWidth: true; Layout.leftMargin: 10; Layout.rightMargin: 10
                            color: "#666"; orientation: Qt.Horizontal ;
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        IconLabel {
                            Layout.fillWidth: true
                            labelText:  qsTr("From")
                            SampleLabel {
                                text: qsTr("Group Chat")
                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.rightMargin: column.spacing
                                color: "#666"
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            }
                        }
                    } // columnLayout2
                } // colmnLayout2Parent

                SampleButton {
                    text: "Message"
                    Layout.fillWidth: true
                    Layout.rightMargin: 50
                    Layout.leftMargin: 50
                    onClicked: {
                        // stackView.pop();
                        __PushPage(Qt.resolvedUrl("./Chat/ChatPage.qml"), {username: "小屁孩"});
                    }
                }

                SampleButton {
                    text: "Free Call"
                    Layout.fillWidth: true
                    Layout.rightMargin: 50
                    Layout.leftMargin: 50
                    onClicked: {
                    }
                }
            } // column
        } // content
    }// scrollview
}

