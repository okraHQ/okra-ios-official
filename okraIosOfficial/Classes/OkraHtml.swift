//
//  OkraHtml.swift
//  okraIosOfficial
//
//  Created by Okra on 26/05/2023.
//

class OkraHTMLStringProvider {
    
    func generateHTMLStringWithOptions(okraOptions: OkraOptions, deviceInfo: [String: Any]) -> String {
        return """
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Okra Flutter SDK</title>
        </head>
        <body onload="buildWithOptions()" style="background-color:#fff;height:100vh">
            <script src="https://cdn.okra.ng/v2/bundle.js"></script>
            <script type="text/javascript">
                window.onload = buildWithOptions;
                function buildWithOptions(){
                    Okra.buildWithOptions({
                        name: '\(okraOptions.clientName)',
                        env: '\(okraOptions.env)',
                        key: '\(okraOptions.key)',
                        token: '\(okraOptions.token)',
                        products: \(okraOptions.products),
                        logo: '\(okraOptions.logo!)',
                        payment: \(okraOptions.payment!),
                        color: '\(okraOptions.color!)',
                        filter: \(okraOptions.filters!),
                        isCorporate: \(okraOptions.isCorporate!),
                        showBalance: \(okraOptions.showBalance!),
                        geoLocation: \(okraOptions.geoLocation!),
                        limit: \(okraOptions.limit!),
                        callback_url: '\(okraOptions.callbackURL!)',
                        connectMessage: '\(okraOptions.connectMessage!)',
                        currency: '\(okraOptions.currency!)',
                        widget_success: '\(okraOptions.widgetSuccess!)',
                        widget_failed: '\(okraOptions.widgetFailed!)',
                        guarantors: \(okraOptions.guarantors!),
                        exp: '\(okraOptions.exp!)',
                       // charge: \(okraOptions.charge!),
                        deviceInfo: '\(deviceInfo)',
                    
                        onSuccess: function(data){
                            let response = {event:'option success', data};
                            window.webkit.messageHandlers.IOSOnSuccess.postMessage(JSON.stringify(response));
                        },
                        onClose: function(){
                            let response = {event:'option close'};
                            window.webkit.messageHandlers.IOSOnClose.postMessage(JSON.stringify(response));
                        },
                        BeforeClose: function(){
                            let response = {event:'option before close'};
                            window.webkit.messageHandlers.IOSBeforeClose.postMessage(JSON.stringify(response));
                        },
                        onError: function(data){
                            let response = {event:'option error', data};
                            window.webkit.messageHandlers.IOSOnError.postMessage(JSON.stringify(response));
                        },
                        onEvent: function(data){
                            let response = {event:'option event', data};
                            window.webkit.messageHandlers.IOSOnEvent.postMessage(JSON.stringify(response));
                        }
                    });
                }
            </script>
        </body>
        </html>
        """
    }
    
    func generateHTMLStringWithShortUrl(shortUrl: String, deviceInfo: [String: Any]) -> String {
        return """
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Okra Flutter SDK</title>
        </head>
        <body onload="buildWithOptions()" style="background-color:#fff;height:100vh">
            <script src="https://cdn.okra.ng/v2/bundle.js"></script>
            <script type="text/javascript">
                window.onload = buildWithShortUrl;
                function buildWithShortUrl(){
                    Okra.buildWithShortUrl({
                        short_url: '\(shortUrl)',
                        deviceInfo: '\(deviceInfo)',
                        
                        onSuccess: function(data){
                            let response = {event:'option success', data};
                            window.webkit.messageHandlers.IOSOnSuccess.postMessage(JSON.stringify(response));
                        },
                        onClose: function(){
                            let response = {event:'option close'};
                            window.webkit.messageHandlers.IOSOnClose.postMessage(JSON.stringify(response));
                        },
                        BeforeClose: function(){
                            let response = {event:'option before close'};
                            window.webkit.messageHandlers.IOSBeforeClose.postMessage(JSON.stringify(response));
                        },
                        onError: function(data){
                            let response = {event:'option error', data};
                            window.webkit.messageHandlers.IOSOnError.postMessage(JSON.stringify(response));
                        },
                        onEvent: function(data){
                            let response = {event:'option event', data};
                            window.webkit.messageHandlers.IOSOnEvent.postMessage(JSON.stringify(response));
                        }
                    });
                }
            </script>
        </body>
        </html>
        """
    }
}

