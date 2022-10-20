import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Table{

        headerModel: [ // widths must add to 1
            {text: 'Column1',   width: 0.5},
            {text: 'Column2',   width: 0.5},

        ]
       /* property variant testlist: [
             ['red',   '#ff0000'],
             ['green', '#00ff00'],
             ['blue',  '#0000ff'],
        ]
        */
        property variant testlist: Tldata.testdata
        dataModel: testlist

        onClicked: print(testlist)

    }
}
