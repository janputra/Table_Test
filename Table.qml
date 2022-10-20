import QtQuick 2.0

 Item { // size controlled by width
        id: root

    // public
        property variant headerModel: [
            // {text: 'Color',         width: 250},
            // {text: 'Hexadecimal',   width: 250},
        ]

        property variant dataModel: [
            // ['red',   '#ff0000'],
            // ['green', '#00ff00'],
            // ['blue',  '#0000ff'],
        ]

        signal clicked();  //onClicked: print('onClicked', row, JSON.stringify(rowData))

    // private
        width: 500;  height: 400

        ListView { // header
            anchors.fill: parent
            orientation: ListView.Horizontal
            interactive: false

            model: headerModel

            delegate: Item { // cell
                width:modelData.width*root.width;  height: 0.14 * root.width

                Rectangle {

                    width: parent.width
                    height: parent.height
                    border.width: 2
                    border.color: "black"

                    Text {
                         x: 0.03 * root.width

                        text: modelData.text
                        font.pixelSize: 0.06 * root.width
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
            MouseArea {
                id: mouseArea

                anchors.fill: parent

                onClicked:  root.clicked()
            }
        }


        ListView { // data
            anchors{fill: parent;  topMargin: 0.14 * root.width}
            interactive: contentHeight > height
            clip: true

            model: dataModel

            delegate: Item { // row
                width: root.width;  height: 0.14 * root.width
                opacity: !mouseseArea.pressed? 1: 0.3 // pressed state

                property int     row:     index     // outer index
                property variant rowData: modelData // much faster than listView.model[row]

                Row {
                    anchors.fill: parent

                    Repeater { // index is column
                        model: rowData // headerModel.length

                        delegate: Item { // cell
                            width: headerModel[index].width * root.width;  height: 0.14 * root.width

                            Rectangle {

                                width: parent.width
                                height: parent.height
                                border.width: 2
                                border.color: "black"

                                Text {
                                     x: 0.03 * root.width

                                    text: modelData
                                    font.pixelSize: 0.06 * root.width
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                //text: modelData


                            }
                        }
                    }
                }



            }



           // ScrollBar{}
        }
    }
