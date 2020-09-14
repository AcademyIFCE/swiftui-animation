//
//  sequence.swift
//  swiftui-animation
//
//  Created by Mateus Rodrigues on 10/09/20.
//  Copyright © 2020 Apple Developer Academy IFCE. All rights reserved.
//

import SwiftUI

typealias Body = () -> Void
typealias Component = (animation: Animation, body: Body)

@discardableResult
func sequence(@AnimationBuilder components: () -> [Component]) -> Double {
    components().reduce(0) { (delay, component) in
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            withAnimation(component.animation, component.body)
        }
        return delay + component.animation.duration
    }
}

func withAnimation(_ animation: Animation, body: @escaping Body) -> Component {
    (animation, body)
}

@_functionBuilder
struct AnimationBuilder {
    static func buildBlock(_ components: Component...) -> [Component] {
        Array(components)
    }
}

extension Animation {
    
    var duration: Double {
        Mirror(reflecting: self).descendant("base", "duration") as! Double
    }
    
}
