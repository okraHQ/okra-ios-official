//
//  ViewController.swift
//  okraIosOfficial
//
//  Created by nzeakokosi7 on 05/26/2023.
//  Copyright (c) 2023 nzeakokosi7. All rights reserved.
//

import UIKit
import okraIosOfficial

class ViewController: UIViewController {
    let launchWithOptionsButton = UIButton(type: .system)
    let launchWithShortUrlButton = UIButton(type: .system)


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraintsAndProperties()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func showOptionsExample(){

        
        let dataDictionary:OkraOptions = OkraOptions(clientName: "ClientName", env: "production-sandbox", key: "c40d1454-f2ca-50f4-9bec-702cddfbc301", token: "61e1a914d8b92c00634236d1", products: ["auth", "identity", "balance", "transactions"], logo: "https://dash.okra.ng/static/media/okra-logo.514fd943.png")
      
        
        Okra.buildWithOptions(
            okraOptions: dataDictionary,
            onClose: onClose,
            onSuccess: onSuccess,
            BeforeClose: BeforeClose,
            onError: onError,
            onEvent: onEvent
        )
        
    }
    
    @objc func showShortUrlExample(){

        
        let shortUrl = "bc_kWKf2l";
        
        Okra.buildWithShortUrl(
            shortUrl: shortUrl,
            onClose: onClose,
            onSuccess: onSuccess,
            BeforeClose: BeforeClose,
            onError: onError,
            onEvent: onEvent
        )
        
    }
    
    func onSuccess(data: String) {
        print("Succesfully connected bank \(data)")
    }
    
    func onError(data: String) {
        print("Error Receieved \(data)")
    }
    
    func onClose(data: String) {
        print("On close Receieved \(data)")
    }
    
    func BeforeClose(data: String) {
        print("Before close Receieved \(data)")
    }
    
    func onEvent(data: String) {
        print("Event Receieved \(data)")
    }

}

