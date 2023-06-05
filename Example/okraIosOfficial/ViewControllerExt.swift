//
//  ViewControllerExt.swift
//  okraIosOfficial_Example
//
//  Created by Okra on 26/05/2023.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

extension ViewController {
    
    func setUpConstraintsAndProperties(){
        
        addAllViews()
        setupLaunchWithOptionsButton()
        setupLaunchWithShortUrlButton()
        view.backgroundColor = UIColor(named: "#e8efeb")
        
    }
    func addAllViews(){
        view.addSubview(launchWithOptionsButton)
        view.addSubview(launchWithShortUrlButton)
        
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                launchWithOptionsButton.heightAnchor.constraint(equalToConstant: 50),
                launchWithOptionsButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 20),
                launchWithOptionsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                launchWithOptionsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                
                launchWithShortUrlButton.heightAnchor.constraint(equalToConstant: 50),
                launchWithShortUrlButton.topAnchor.constraint(equalTo: launchWithOptionsButton.bottomAnchor, constant: 20),
                launchWithShortUrlButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                launchWithShortUrlButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            ])
        } else {
            NSLayoutConstraint.activate([
                launchWithOptionsButton.heightAnchor.constraint(equalToConstant: 50),
                launchWithOptionsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
                launchWithOptionsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                launchWithOptionsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                launchWithShortUrlButton.heightAnchor.constraint(equalToConstant: 50),
                launchWithShortUrlButton.topAnchor.constraint(equalTo: launchWithOptionsButton.bottomAnchor, constant: 20),
                launchWithShortUrlButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                launchWithShortUrlButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        }

    }
    
    func setupLaunchWithOptionsButton(){
        launchWithOptionsButton.setTitle("LAUNCH OKRA WITH OPTIONS", for: .normal)
        launchWithOptionsButton.setTitleColor(.white, for: .normal)
        launchWithOptionsButton.backgroundColor = UIColor(named: "#86aba1")
        launchWithOptionsButton.layer.cornerRadius = 4
        launchWithOptionsButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        launchWithOptionsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        launchWithOptionsButton.translatesAutoresizingMaskIntoConstraints = false
        launchWithOptionsButton.addTarget(self, action: #selector(showOptionsExample), for: .touchUpInside)
 
    }
    
    func setupLaunchWithShortUrlButton(){
        launchWithShortUrlButton.setTitle("LAUNCH OKRA WITH SHORT URL", for: .normal)
        launchWithShortUrlButton.setTitleColor(.white, for: .normal)
        launchWithShortUrlButton.backgroundColor = UIColor(named: "#86aba1")
        launchWithShortUrlButton.layer.cornerRadius = 4
        launchWithShortUrlButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        launchWithShortUrlButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        launchWithShortUrlButton.translatesAutoresizingMaskIntoConstraints = false
        launchWithShortUrlButton.addTarget(self, action: #selector(showShortUrlExample), for: .touchUpInside)
 
    }
}
