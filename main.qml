/****************************************************************************
 ** main.qml
 ** PrintPartReq
 **
 ** Copyright (c) 2014 Jürgen Mülbert. All rights reserved.
 **
 ** This program is free software: you can redistribute it and/or modify
 ** it under the terms of the European Union Public Licence (EUPL),
 ** version 1.1.
 **
 ** This program is distributed in the hope that it will be useful,
 ** but WITHOUT ANY WARRANTY; without even the implied warranty of
 ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ** European Union Public Licence for more details.
 **
 ** You should have received a copy of the European Union Public Licence
 ** along with this program. If not, see
 ** http://www.osor.eu/eupl/european-union-public-licence-eupl-v.1.1
 **
 ****************************************************************************/


import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0

import "content"

ApplicationWindow {
    visible: true
    width: 640
    height: 800
    minimumHeight: 720
    minimumWidth: 640
    title: qsTr("Print Part Request")

    AboutDialog { id: aboutDialog }
	PreferencesDialog { id: preferencesDialog }


    Action {
        id: newAction
        text: qsTr("&New")
        iconSource: "images/document-new.png"
    }

    Action {
    	id: prefsAction
    	text: qsTr("Prefrences")
        iconSource: "images/document-properties.png"
    	onTriggered: preferencesDialog.open()
    }

    Action {
    	id: printAction
    	text: qsTr("Print")
        iconSource: "images/document-print.png"
    }

    Action {
    	id: aboutAction
    	text: "About"
    	onTriggered: aboutDialog.open()
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem { action: newAction  }
            MenuItem { action: printAction }

         	MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }

        Menu {
            title: qsTr("&Edit")
            MenuItem { action: prefsAction }

        }
        Menu {
            title: qsTr("&Help")
            MenuItem { action: aboutAction }
        }
    }

	toolBar: ToolBar {
		id: toolBar
        RowLayout {
        	id: toolbarLayout
        	spacing: 0
        	width: parent.width
            ToolButton { action: newAction }
            ToolButton { action: printAction }
            ToolButton { action: prefsAction }
        }
    }

    ColumnLayout {
        id: contentRow
        anchors.fill: parent

    	Row {
    		GroupBox {
	 			title: qsTr("Priority")
					Row {
					    ExclusiveGroup { id: group }
					    RadioButton {
					        text: qsTr("30 Min.")
 						   	exclusiveGroup: group
 							checked: true
					    }
					    RadioButton {
 					   		text: qsTr("2 Hours")
					    	exclusiveGroup: group
					    }
					    RadioButton {
 					   		text: qsTr("1 Day")
					        exclusiveGroup: group
					    }
					}
				}
    		}


        GroupBox {
            id: orderGrpBox
            title: qsTr("Order")
            Layout.fillWidth: true

            GridLayout {
                id: gridLayout
                rows: 2
                columns: 8
                flow: GridLayout.TopToBottom
                anchors.fill: parent


                Label { text: "SB" }
                Label { text: "Order" }

				ComboBox {
                    editable: false
                    model: ListModel {
                        id: modelSB
                        ListElement { text: "SB 1" }
                        ListElement { text: "SB 2"}
                        ListElement { text: "SB 3"}
                    }
                }

                TextField {
                    id: textFieldOrder
                }

                Label { text: qsTr("MT") }
                Label { text: "" }
                ComboBox {
                    editable: false
                    model: ListModel {
                        id: modelMT
                        ListElement { text: "MT 1" }
                        ListElement { text: "MT 2"}
                        ListElement { text: "MT 3"}
                    }
                }
                Label { text: "" }
                Label { text: "Model" }
                Label { text: "Year" }
                ComboBox {
                    editable: false
                    model: ListModel {
                        id: modelModel
                        ListElement { text: "Model 1" }
                        ListElement { text: "Model 2" }
                        ListElement { text: "Model 3" }
                    }
                }
                /**
				Calendar {
					id: calendarModelYear
				}
                **/
                TextField {
                    id: dateModelYear
                    }
            }
        }

       RowLayout {
            id: layoutParts


                GroupBox {
                    id: groupBoxParts
                    title: qsTr("Requestet Parts")
                    Column {
                        spacing: 2

                        CheckBox {
                            text: qsTr("Oilfilter")
                        }

                        CheckBox {
                            text: qsTr("Wiper blades front")
                        }

                        CheckBox {
                            text: qsTr("Wiper blades rear")
                        }

                        CheckBox {
                       text: qsTr("Breakpads front")
                        }

                        CheckBox {
                            text: qsTr("Breakpads read")
                        }

                        CheckBox {
                            text: qsTr("Breakdisk front")
                        }

                        CheckBox {
                            text: qsTr("Breakdisk rear")
                        }
                        CheckBox {
                            text: qsTr("Break Warn Contacts")
                        }
                        CheckBox {
                            text: qsTr("V-Belt")
                        }
                        CheckBox {
                            text: qsTr("Spark Plugs")
                        }
                        CheckBox {
                            text: qsTr("Airfilter")
                        }
                        CheckBox {
                            text: qsTr("Particel Filter")
                        }
                        CheckBox {
                            text: qsTr("Fuel Filter")
                        }
                        CheckBox {
                            text: qsTr("Ignition Coil")
                        }
                        CheckBox {
                            text: qsTr("Emergency Set")
                        }
                        CheckBox {
                            text: qsTr("Tire Dichtmittel")
                        }
                        CheckBox {
                            text: qsTr("Curve Light Bulb")
                        }
                        CheckBox {
                            text: qsTr("Fuel Clap Angle")
                        }
                        CheckBox {
                            text: qsTr("Brake Light Bulb")
                        }
                        CheckBox {
                            text: qsTr("Standing Light Bulb")
                        }
                        CheckBox {
                            text: qsTr("License Plate Bulb")
                        }
                     }
                  }


                GroupBox {
                    id: groupBoxFluids
                    title: qsTr("Fluids")

                    Column {
                        Row {
                            Label { text: qsTr("Oil 1") }
                            SpinBox { id: oil1SpinBox; decimals:  1 }
                        }
                        Row {
                            Label { text: qsTr("Oil 2") }
                            SpinBox { id: oil2SpinBox; decimals:  1 }
                        }
                        Row {
                            Label { text: qsTr("Windowfluid") }
                            SpinBox { id: windowfluidSpinBox; decimals:  0 }
                        }
                        Row {
                            Label { text: qsTr("Cooling Fluid") }
                            SpinBox { id: coolingfluidSpinBox; decimals:  0 }
                        }
                        Row {
                            Label { text: qsTr("Brake Fluid") }
                            SpinBox { id: brakefluidSpinBox; decimals:  2 }
                        }
                        Row {
                            Label { text: qsTr("Pentosin") }
                            SpinBox { id: pentosinSpinBox; decimals:  0 }
                        }
                        Row {
                            Label { text: qsTr("Automatic Fluid 1") }
                            SpinBox { id: automaticfluid1SpinBox; decimals:  2 }
                        }
                        Row {
                            Label { text: qsTr("Automatic Fluid 2") }
                            SpinBox { id: automaticfluid2SpinBox; decimals:  2 }
                        }
                        Row {
                            Label { text: qsTr("Transmission Oil") }
                            SpinBox { id: transmissionoilSpinBox; decimals:  2 }
                        }
                        Row {
                            Label { text: qsTr("Transmision Oil 2") }
                            SpinBox { id: transmissionoil2SpinBox; decimals:  2 }
                        }
                    }
                }
            }

        RowLayout {
            GroupBox {
                title: qsTr("More Parts")
                Column {
                    TextField { }
                    TextField { }
                    TextField { }
                    TextField { }
                    TextField { }
                    TextField { }
                    TextField { }
                    TextField { }
                    TextField { }
                    TextField { }
                }
            }

            GroupBox {
                title: qsTr("Comments")
                Column {
                    TextArea {

                    }
                }
            }
        }

        Button {
            text: qsTr("Print")
        }

    }
    statusBar: StatusBar {
        RowLayout {
            Label {
            	id: statusLabel
            	text: "Read Only" }
        }
     }
}

/**
 **/

