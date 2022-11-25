/*
 * This file is part of harbour-dwd.
 * Copyright (C) 2021 <blueprint@poetaster.de> Mark Washeim
 *
 * harbour-dwd is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * harbour-dwd is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with harbour-dwd.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

import QtQuick 2.6
import Sailfish.Silica 1.0
import Sailfish.WebView 1.0
import Sailfish.WebEngine 1.0

Page {

    property bool debug: true

    id:webLView
    allowedOrientations: Orientation.All

    onStatusChanged: {

        if (PageStatus.Activating) {
        }

        /*
        switch (status) {
            case PageStatus.Activating:
                indicator.visible = true;
                errorMsg.visible = false;
                break;
            case PageStatus.Deactivating:
                errorMsg.visible = false;
                break;
        }
        */
    }

    WebView {

        id: webview
        anchors.fill: parent
        url: Qt.resolvedUrl("index.html")

        Component.onCompleted: { }
        onViewInitialized: {
            /*  webview.loadFrameScript(Qt.resolvedUrl("../html/framescript.js"));
                webview.addMessageListener("webview:action");
                webview.runJavaScript("return latlon('" + lat + "','" + lon + "')");
            */
        }
        on_PageOrientationChanged: {
            console.log("changed orientation")

            /*if ( data.topic != lon ) {
                        webview.runJavaScript("return latlon('" + lat + "','" + lon + "')");
                }*/

        }

        onRecvAsyncMessage: {
            if (debug) console.debug(message)
            //webview.runJavaScript("return latlon('" + lat + "','" + lon + "')");
            switch (message) {
            case "embed:contentOrientationChanged":
                break
            case "webview:action":
                /*if ( data.topic != lon ) {
                        webview.runJavaScript("return latlon('" + lat + "','" + lon + "')");
                        if (debug) console.debug(data.topic)
                        if (debug) console.debug(data.also)
                        if (debug) console.debug(data.src)
                    }*/
                break
            }
        }
    }

}
