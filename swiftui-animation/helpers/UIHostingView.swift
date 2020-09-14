//
//  UIHostingView.swift
//  swiftui-animation
//
//  Created by Mateus Rodrigues on 10/09/20.
//  Copyright © 2020 Apple Developer Academy IFCE. All rights reserved.
//

import SwiftUI

open class UIHostingView<Content: View>: UIView {
    
    private let hostingController: UIHostingController<Content>
    
    public required init(rootView: Content, viewController: UIViewController? = nil) {
        hostingController = UIHostingController(rootView: rootView)
        hostingController.view.backgroundColor = .clear
        super.init(frame: .zero)
        addSubview(hostingController.view)
        if let viewController = viewController {
            viewController.addChild(hostingController)
            hostingController.didMove(toParent: viewController)
        }
    }
    
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        hostingController.view.frame = bounds
    }
    
}
