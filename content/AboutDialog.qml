/****************************************************************************
 ** AboutDialog.qml
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

import QtQuick 2.2
import QtQuick.Dialogs 1.1

MessageDialog {
	id: aboutDialog
    title: qsTr("About Print Part Request")
    text: qsTr("This is a Program for printint Part Requests to a specified printer")
    icon: StandardIcon.Information
}