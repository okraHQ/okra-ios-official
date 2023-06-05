//
//  Okra.swift
//  okraIosOfficial
//
//  Created by Okra on 26/05/2023.
//

import Foundation
import UIKit

public class Okra: NSObject {
    
    public static func buildWithOptions(
        okraOptions: OkraOptions,
        onClose: @escaping (_ : String) -> Void,
        onSuccess: @escaping (_ : String) -> Void,
        BeforeClose: @escaping (_ : String) -> Void,
        onError: @escaping (_ : String) -> Void,
        onEvent: @escaping (_ : String) -> Void
    ) {
        let storyboardBundle = Bundle(for: self)
        let storyboard: UIStoryboard = UIStoryboard(name: "MainWeb", bundle: storyboardBundle)
        
        if let pageTwo = storyboard.instantiateViewController(withIdentifier: "okraWebView") as? OkraWebView {
            pageTwo.modalPresentationStyle = .fullScreen
            pageTwo.okraOptions = okraOptions
            pageTwo.onClose = onClose
            pageTwo.onSuccess = onSuccess
            pageTwo.BeforeClose = BeforeClose
            pageTwo.onError = onError
            pageTwo.onEvent = onEvent
            pageTwo.useShortUrl = false
            UIApplication.shared.keyWindow?.rootViewController?.present(pageTwo, animated: true, completion: nil)
        }
    }
    
    public static func buildWithShortUrl(
        shortUrl: String,
        onClose: @escaping (_ : String) -> Void,
        onSuccess: @escaping (_ : String) -> Void,
        BeforeClose: @escaping (_ : String) -> Void,
        onError: @escaping (_ : String) -> Void,
        onEvent: @escaping (_ : String) -> Void
    ) {
        let storyboardBundle = Bundle(for: self)
        let storyboard: UIStoryboard = UIStoryboard(name: "MainWeb", bundle: storyboardBundle)
        
        if let pageTwo = storyboard.instantiateViewController(withIdentifier: "okraWebView") as? OkraWebView {
            pageTwo.modalPresentationStyle = .fullScreen
            pageTwo.shortUrl = shortUrl
            pageTwo.onClose = onClose
            pageTwo.onSuccess = onSuccess
            pageTwo.BeforeClose = BeforeClose
            pageTwo.onError = onError
            pageTwo.onEvent = onEvent
            pageTwo.useShortUrl = true
            UIApplication.shared.keyWindow?.rootViewController?.present(pageTwo, animated: true, completion: nil)
        }
    }
}

