//
//  Star.swift
//  SwiftUIStarfield
//
//  Created by Peter Bødskov on 11/01/2023.
//

import SwiftUI

class Star: CAEmitterCell {
    override init() {
        super.init()
        var image: CGImage?
        if let context = CGContext(
            data: nil,
            width: 10,
            height: 10,
            bitsPerComponent: 8,
            bytesPerRow: 4 * 10,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue
        ) {
            context.setFillColor(.white)
            context.addPath(CGPath(ellipseIn: CGRect(origin: .zero, size: CGSize(width: 10.0, height: 10.0)), transform: nil))
            context.drawPath(using: .fill)
            image = context.makeImage()
        }
        self.contents = image
        self.color = NSColor.white.withAlphaComponent(0.0).cgColor
        self.color = NSColor.white.withAlphaComponent(0.0).cgColor
        self.lifetime = 20.0
        self.lifetimeRange = 1
        self.birthRate = 40.0
        self.scale = 0.1
        self.scaleRange = 0.4
        self.scaleSpeed = 0.005
        self.alphaRange = 0.5
        self.alphaSpeed = 0.3
        self.velocityRange = 100.0
        self.velocity = 100.0
        self.emissionRange = .pi
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

