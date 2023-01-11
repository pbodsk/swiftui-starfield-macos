//
//  InternalParticlesView.swift
//  SwiftUIStarfield
//
//  Created by Peter Bødskov on 11/01/2023.
//

import Foundation
import SwiftUI

final class InternalParticlesView: NSView {
    private var particleEmitter: CAEmitterLayer?
    
    func emit(
        from center: CGPoint,
        size: CGSize,
        shape: CAEmitterLayerEmitterShape,
        cells: [CAEmitterCell]
    ) {
        if particleEmitter == nil {
            particleEmitter = CAEmitterLayer()
            wantsLayer = true
            layer?.addSublayer(particleEmitter!)
        }
        
        particleEmitter?.emitterPosition = center
        particleEmitter?.emitterSize = size
        particleEmitter?.emitterShape = shape
        particleEmitter?.emitterCells = cells
    }
}
