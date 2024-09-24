//
//  XpertFive9ChatViewModel.swift
//  XpertFive9Chat
//
//  Created by Anton Yarmolenka on 19/09/2024.
//

import Foundation

public class XpertFive9ChatViewModel: ObservableObject {
    public var xpertConfiguration: XpertChatConfiguration
    public var five9Configuration: Five9ChatConfiguration
    
    init(xpertConfig: XpertChatConfiguration, five9Config: Five9ChatConfiguration) {
        self.xpertConfiguration = xpertConfig
        self.five9Configuration = five9Config
    }
        
    // MARK: Five9
    // swiftlint:disable line_length
    public var five9HTML: String {
        """
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, \
                viewport-fit=cover">
                <style id="fit-graphics">
                    iframe {
                        width: 100% !important;
                    }
                </style>
            </head>
            <body>
                <script src="https://live-chat.ps.five9.com/Five9ChatPlugin.js" type="text/javascript"></script>
                <script>
                    function callback(event) {
                        try {
                            switch (event.type) {
                            case 'initialized':
                                window.webkit.messageHandlers.###openChat###.postMessage("###openChat###");
                                break;
                            case 'error':
                                if (event.error == "No active chat session") {
                                    window.webkit.messageHandlers.###closeChat###.postMessage("###closeChat###");
                                }
                                break;
                            case 'endChatConfirmed':
                                window.webkit.messageHandlers.###closeChat###.postMessage("###closeChat###");
                                break;
                            default:
                                break;
                        }
                        } catch (exception) {}
                    }
                    let options = {
                        "appId": "###APPID###",
                        "configId": "###CONFIGID###",
                        "headless": true,
                        "startOpen": true,
                        "allowAttachments": true,
                        "allowPopout": false,
                        "hideMinimize": true,
                        "miniForm": true,
                        "subtitle": "###SUBTITLE###",
                        "contact": {
                            "email": "###EMAIL###",
                            "name": "###NAME###"
                        },
                        "sendButtonText": "<img src='data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjUxMnB4IiBoZWlnaHQ9IjUxMnB4IiB2aWV3Qm94PSIwIDAgNTM1LjUgNTM1LjUiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUzNS41IDUzNS41OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+CjxnPgoJPGcgaWQ9InNlbmQiPgoJCTxwb2x5Z29uIHBvaW50cz0iMCw0OTcuMjUgNTM1LjUsMjY3Ljc1IDAsMzguMjUgMCwyMTYuNzUgMzgyLjUsMjY3Ljc1IDAsMzE4Ljc1ICAgIiBmaWxsPSIjY2JjYmNiIi8+Cgk8L2c+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==' class='rcw-send-icon' alt='Send'>",
                        "sendButtonActiveText": "<img src='data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjUxMnB4IiBoZWlnaHQ9IjUxMnB4IiB2aWV3Qm94PSIwIDAgNTM1LjUgNTM1LjUiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUzNS41IDUzNS41OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+CjxnPgoJPGcgaWQ9InNlbmQiPgoJCTxwb2x5Z29uIHBvaW50cz0iMCw0OTcuMjUgNTM1LjUsMjY3Ljc1IDAsMzguMjUgMCwyMTYuNzUgMzgyLjUsMjY3Ljc1IDAsMzE4Ljc1ICAgIiBmaWxsPSIjY2JjYmNiIi8+Cgk8L2c+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==' class='rcw-send-icon' alt='Send' style='filter: contrast(0)' >",
                        "formData": ###FORMDATA###
                    };
                    options.callback = callback;
                    Five9ChatPlugin(options);
                </script>
            </body>
        </html>
        """
//            .replacingOccurrences(of: "###FORMDATA###", with: formDataString(formFields: five9Configuration.formFields))
//            .replacingOccurrences(of: "###SUBTITLE###", with: five9Configuration.formSubtitle)
//            .replacingOccurrences(of: "###EMAIL###", with: five9Configuration.userEmail)
//            .replacingOccurrences(of: "###CONFIGID###", with: five9Configuration.configID)
//            .replacingOccurrences(of: "###APPID###", with: five9Configuration.appId)
//            .replacingOccurrences(of: "###openChat###", with: WKScriptEvent.openChat.rawValue)
//            .replacingOccurrences(of: "###closeChat###", with: WKScriptEvent.closeChat.rawValue)
//            .replacingOccurrences(of: "###NAME###", with: five9Configuration.userName)
    }
    
    // MARK: Xpert
    public var xpertHTML: String {
        """
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, \
                viewport-fit=cover">
                <link rel="stylesheet" href="https://chatbot-frontend.prod.ai.2u.com/@latest/index.min.css" />
                <style type="text/css">
                    .intercom-lightweight-app-launcher {
                        display: none !important;
                    }
                </style>
                <style id="fit-graphics">
                    iframe {
                        width: 100% !important;
                        height: 100% !important;
                    }
                </style>
            </head>
            <body>
                <script>
                    window.XpertChatbotFrontend = {
                        xpertKey: '###XPERT_KEY###',
                        configurations: {
                            chatApi: {
                                payloadParams: {
                                    use_case: ###USE_CASE###,
                                },
                            },
                            conversationScreen: {
                                liveChat: {
                                    options: {
                                        appId: '###APPID###',
                                        allowPopout: false
                                    },
                                },
                            },
                        },
                    };
                </script>
                <script type="module" src="https://chatbot-frontend.prod.ai.2u.com/@latest/index.min.js"></script>
                <script>
                !function(){var i="analytics",analytics=window[i]=window[i]||[];if(!analytics.initialize)if(analytics.invoked)window.console&&console.error&&console.error("Segment snippet included twice.");else{analytics.invoked=!0;analytics.methods=["trackSubmit","trackClick","trackLink","trackForm","pageview","identify","reset","group","track","ready","alias","debug","page","screen","once","off","on","addSourceMiddleware","addIntegrationMiddleware","setAnonymousId","addDestinationMiddleware","register"];analytics.factory=function(e){return function(){if(window[i].initialized)return window[i][e].apply(window[i],arguments);var n=Array.prototype.slice.call(arguments);if(["track","screen","alias","group","page","identify"].indexOf(e)>-1){var c=document.querySelector("link[rel='canonical']");n.push({__t:"bpc",c:c&&c.getAttribute("href")||void 0,p:location.pathname,u:location.href,s:location.search,t:document.title,r:document.referrer})}n.unshift(e);analytics.push(n);return analytics}};for(var n=0;n<analytics.methods.length;n++){var key=analytics.methods[n];    analytics[key]=analytics.factory(key)}analytics.load=function(key,n){var t=document.createElement("script");t.type="text/javascript";t.async=!0;t.setAttribute("data-global-segment-analytics-key",i);t.src="https://cdn.segment.com/analytics.js/v1/" + key + "/analytics.min.js";var r=document.getElementsByTagName("script")[0];r.parentNode.insertBefore(t,    r);analytics._loadOptions=n};analytics._writeKey="###SEGMENTKEY###";;analytics.SNIPPET_VERSION="5.2.0";
                    analytics.load("###SEGMENTKEY###");
                    analytics.page();
                }}();
                </script>
                <script>
                    document.addEventListener(
                        "DOMSubtreeModified",
                        function(e) {
                            var container = document.getElementById("xpert-chatbot-container");
                            if (container != undefined) {
                                var button = container.getElementsByTagName("button")[0];
                                if (button != undefined && button.isClicked == undefined) {
                                    setTimeout(() => {
                                        button.click();
                                    }, 500);
                                    button.isClicked = true;
                                }
                            }
                            var xpertCloseButton = document.getElementsByClassName("xpert-chatbot-popup__header--btn-outline")[0];
                            if (xpertCloseButton != undefined) {
                                xpertCloseButton.addEventListener(
                                    "click",
                                    function(e) {
                                        window.webkit.messageHandlers.###closeChat###.postMessage("###closeChat###");
                                    },
                                    false
                                );
                            }
                        },
                        false
                    );
                </script>
            </body>
        </html>
        """
            .replacingOccurrences(of: "###XPERT_KEY###", with: xpertConfiguration.xpertKey)
            .replacingOccurrences(of: "###USE_CASE###", with: xpertConfiguration.useCase)
            .replacingOccurrences(of: "###APPID###", with: five9Configuration.appId)
            .replacingOccurrences(of: "###SEGMENTKEY###", with: xpertConfiguration.segmentKey)
            .replacingOccurrences(of: "###closeChat###", with: WKScriptEvent.closeChat.rawValue)
    }
    // swiftlint:enable line_length
    
}
