//
//  SwiftUIView.swift
//  swiftui-animation
//
//  Created by Mateus Rodrigues on 10/09/20.
//  Copyright © 2020 Apple Developer Academy IFCE. All rights reserved.
//

import SwiftUI
import Combine

struct SwiftUIView: View {
    
    @State private var selectedID: Int?
    @State private var scaleAmount: CGFloat = 1.0
    
    var onDidChange: ((Int?) -> Void)?
    
    var body: some View {
        HStack {
            ForEach(0..<5) { id in
                ZStack {
                    if self.selectedID == id {
                        Circle()
                            .fill(Color.green)
                            .transition(.scale)
                    }
                    Circle()
                        .strokeBorder(Color.black, lineWidth: 1)
                }
                .scaleEffect(self.selectedID == id ? self.scaleAmount : 1.0)
                .contentShape(Circle())
                .onTapGesture {
                    self.onDidChange?(id)
                    sequence {
                        withAnimation(.easeIn(duration: 0.25)) {
                            self.selectedID = id
                        }
                        withAnimation(.easeOut(duration: 0.25)) {
                            self.scaleAmount = 1.20
                        }
                        withAnimation(.linear(duration: 0.25)) {
                            self.scaleAmount = 1.00
                        }
                    }
                }
            }
        }
        .padding()
        .border(Color.gray)
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
