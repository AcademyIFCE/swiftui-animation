//
//  ViewController.swift
//  swiftui-animation
//
//  Created by Mateus Rodrigues on 10/09/20.
//  Copyright © 2020 Apple Developer Academy IFCE. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    private lazy var swiftUIView = UIHostingView(rootView: SwiftUIView(onDidChange: onDidChange(_:)), viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(swiftUIView)
        
        swiftUIView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            swiftUIView.heightAnchor.constraint(equalToConstant: 200),
            swiftUIView.widthAnchor.constraint(equalToConstant: 250),
            swiftUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swiftUIView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

    }
    
    private func onDidChange(_ value: Int?) {
        print(value ?? "none")
    }

}

