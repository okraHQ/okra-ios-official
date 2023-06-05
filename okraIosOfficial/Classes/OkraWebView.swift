//
//  OkraWebView.swift
//  okraIosOfficial
//
//  Created by Okra on 26/05/2023.
//

import Foundation
import UIKit
import WebKit
import DeviceKit
import AdSupport


class OkraWebView: UIViewController, WKScriptMessageHandler, WKNavigationDelegate {
//    public var dataDictionary: [String:Any]!
//    public var baseController: UIViewController?
    public var okraOptions: OkraOptions?
    public var shortUrl: String?
    public var useShortUrl: Bool
    public var onClose: (_ : String) -> Void?
    public var onSuccess: (_ : String) -> Void?
    public var BeforeClose: (_ : String) -> Void?
    public var onError: (_ : String) -> Void?
    public var onEvent: (_ : String) -> Void?

    let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    private var webView: WKWebView!
    
    init(
        okraOptions: OkraOptions?,
        shortUrl: String?,
        useShortUrl: Bool,
        onClose: @escaping (_ : String) -> Void,
        onSuccess: @escaping (_ : String) -> Void,
        BeforeClose: @escaping (_ : String) -> Void,
        onError: @escaping (_ : String) -> Void,
        onEvent: @escaping (_ : String) -> Void
    ) {
        self.okraOptions = okraOptions
        self.useShortUrl = useShortUrl
        self.onClose = onClose
        self.onSuccess = onSuccess
        self.BeforeClose = BeforeClose
        self.onError = onError
        self.onEvent = onEvent
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder aDecoder: NSCoder) {
        self.onClose = { _ in }
        self.onSuccess = { _ in }
        self.BeforeClose = { _ in }
        self.onError = { _ in }
        self.onEvent = { _ in }
        self.useShortUrl = false
        super.init(coder: aDecoder)
    }
    
    @IBOutlet var web: WKWebView!

    override func viewDidLoad() {
            super.viewDidLoad()
            
            webView = WKWebView(frame: view.bounds)
            webView.configuration.userContentController.add(self, name: "IOSOnSuccess")
            webView.configuration.userContentController.add(self, name: "IOSOnClose")
            webView.configuration.userContentController.add(self, name: "IOSBeforeClose")
            webView.configuration.userContentController.add(self, name: "IOSOnError")
            webView.configuration.userContentController.add(self, name: "IOSOnEvent")
            webView.navigationDelegate = self
            view.addSubview(webView)
               
               loadHTMLString()
               setUpActivityIndicator()
               disableZoom()
           }
           
           func loadHTMLString() {
               let device = Device.current
               let deviceName = device.name
               let osVersion = device.systemVersion
               let osName = device.systemName
               let advertisingIdentifier = ASIdentifierManager.shared().advertisingIdentifier
               let deviceID = advertisingIdentifier.uuidString
               
              let deviceInfo = [
                   "deviceName": deviceName!,
                   "deviceId": deviceID,
                   "osName": osName!,
                   "osVersion": osVersion!,
                   "platform": "ios"
               ]
                              
               let htmlStringProvider = OkraHTMLStringProvider();
               var htmlString = "";
               if (useShortUrl) {
                   htmlString = htmlStringProvider.generateHTMLStringWithShortUrl(shortUrl: shortUrl!, deviceInfo: deviceInfo);
               } else {
                   htmlString = htmlStringProvider.generateHTMLStringWithOptions(okraOptions: okraOptions!, deviceInfo: deviceInfo);
               }
               webView.loadHTMLString(htmlString, baseURL: nil)

           }
    
        func disableZoom() {
            let source: String = """
            var meta = document.createElement('meta');
            meta.name = 'viewport';
            meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
            var head = document.getElementsByTagName('head')[0];
            head.appendChild(meta);
            """

            let script = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
            webView.configuration.userContentController.addUserScript(script)
        }
        
        func setUpActivityIndicator() {
            indicator.center = webView.center
            indicator.hidesWhenStopped = true
            webView.addSubview(indicator)
            indicator.startAnimating()
        }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let bodyString = message.body as? String else { return }
            
            switch message.name {
            case "IOSOnSuccess":
                onSuccess(bodyString)
//                if let dataDictionary = formatJson(text: bodyString) {
//
//                }
                
            case "IOSOnError":
                onError(bodyString)
                
            case "IOSOnClose":
                  onClose(bodyString)
                
            case "IOSBeforeClose":
                  BeforeClose(bodyString)
                
            case "IOSOnEvent":
                  onEvent(bodyString)
                
            default:
                break
            }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Page has finished loading, perform any necessary tasks
        indicator.stopAnimating() // Stop the activity indicator
        // Additional logic you want to execute
    }
    
    func formatJson(text: String) -> [String: Any]? {
        guard let data = text.data(using: .utf8) else {
            return nil
        }

        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            if let jsonDictionary = jsonObject as? [String: Any] {
                return jsonDictionary
            }
        } catch {
            print("Error parsing JSON: \(error)")
        }

        return nil
    }

}

public struct OkraOptions {
    let clientName: String
    let env: String
    let key: String
    let token: String
    let products: [String]
    let logo: String?
    let payment: Bool?
    let color: String?
    let filters: [String]?
    let isCorporate: Bool?
    let showBalance: Bool?
    let geoLocation: Bool?
    let multiAccount: Bool?
    let limit: Int?
    let callbackURL: String?
    let connectMessage: String?
    let currency: String?
    let widgetSuccess: String?
    let widgetFailed: String?
    let guarantors: [String]?
    let exp: String?
    let charge: [String: Any]?
    // Add other properties as needed

    public init(clientName: String, env: String, key: String, token: String, products: [String], logo: String?, payment: Bool? = false, color: String? = "#3AB795", filters: [String]? = [], isCorporate: Bool? = false, showBalance: Bool? = false, geoLocation: Bool? = false, multiAccount: Bool? = true, limit: Int? = 24, callbackURL: String? = "", connectMessage: String? = "", currency: String? = "NGN", widgetSuccess: String? = "", widgetFailed: String? = "", guarantors: [String]? = [], exp: String? = "", charge: [String: Any]? = [:]) {
        self.clientName = clientName
        self.env = env
        self.key = key
        self.token = token
        self.products = products
        self.logo = logo
        self.payment = payment
        self.color = color
        self.filters = filters
        self.isCorporate = isCorporate
        self.showBalance = showBalance
        self.geoLocation = geoLocation
        self.multiAccount = multiAccount
        self.limit = limit
        self.callbackURL = callbackURL
        self.connectMessage = connectMessage
        self.currency = currency
        self.widgetSuccess = widgetSuccess
        self.widgetFailed = widgetFailed
        self.guarantors = guarantors
        self.exp = exp
        self.charge = charge
        // Initialize other properties if needed
    }
}

