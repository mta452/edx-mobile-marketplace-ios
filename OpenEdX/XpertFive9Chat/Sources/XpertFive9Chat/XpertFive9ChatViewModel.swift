//
//  XpertFive9ChatViewModel.swift
//  XpertFive9Chat
//
//  Created by Anton Yarmolenka on 19/09/2024.
//

import Foundation

public class XpertFive9ChatViewModel: ObservableObject {
    private var xpertConfiguration: XpertChatConfiguration
    
    init(xpertConfig: XpertChatConfiguration) {
        self.xpertConfiguration = xpertConfig
    }
        
    // swiftlint:disable line_length
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
            .replacingOccurrences(of: "###SEGMENTKEY###", with: xpertConfiguration.segmentKey)
            .replacingOccurrences(of: "###closeChat###", with: WKScriptEvent.closeChat.rawValue)
    }
    // swiftlint:enable line_length
    
}
