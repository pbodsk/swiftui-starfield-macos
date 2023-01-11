//
//  ContentView.swift
//  SwiftUIStarfield
//
//  Created by Peter Bødskov on 10/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                EmitterView {
                    Star()
                }
                .emitterSize(.init(width: 1, height: 1))
                .emitterShape(.rectangle)
                .emitterPosition(
                    .init(
                        x: geo.size.width / 2,
                        y: geo.size.height / 2
                    )
                )
                .background(.black)
            }
        }
    }    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
