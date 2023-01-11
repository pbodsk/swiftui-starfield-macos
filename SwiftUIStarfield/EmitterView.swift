//
//  EmitterView.swift
//  SwiftUIStarfield
//
//  Created by Peter Bødskov on 10/01/2023.
//

import Foundation
import SwiftUI

struct EmitterView: NSViewRepresentable {
    var center: CGPoint = .zero
    var size: CGSize = .init(width: 0.0, height: 0.0)
    var shape: CAEmitterLayerEmitterShape = .rectangle
    var cells: [CAEmitterCell] = []
    
    typealias NSViewType = InternalParticlesView
    
    func makeNSView(context: Context) -> InternalParticlesView {
                let view = InternalParticlesView()
                view.emit(
                    from: center,
                    size: size,
                    shape: shape,
                    cells: cells
                )
                return view
        
    }
    
    func updateNSView(_ nsView: InternalParticlesView, context: Context) {
        nsView.emit(
            from: center,
            size: size,
            shape: shape,
            cells: cells
        )
    }
}

extension EmitterView {
    func emitterSize(_ size: CGSize) -> Self {
        return EmitterView(
            center: self.center,
            size: size,
            shape: self.shape,
            cells: self.cells
        )
    }
    
    func emitterPosition(_ position: CGPoint) -> Self {
        return EmitterView(
            center: position,
            size: self.size,
            shape: self.shape,
            cells: self.cells
        )
    }
    
    func emitterShape(_ shape: CAEmitterLayerEmitterShape) -> Self {
        return EmitterView(
            center: self.center,
            size: self.size,
            shape: shape,
            cells: self.cells
        )
    }
}

// This is really interesting :) Like a @ViewBuilder but for normal content
@resultBuilder
struct EmitterCellBuilder {
    static func buildBlock(_ cells: CAEmitterCell...) -> [CAEmitterCell] {
        Array(cells)
    }
}

extension EmitterView {
    init(@EmitterCellBuilder _ content: () -> [CAEmitterCell]) {
        self.init(cells: content())
    }
    
    init(@EmitterCellBuilder _ content: () -> CAEmitterCell) {
        self.init(cells: [content()])
    }
}
