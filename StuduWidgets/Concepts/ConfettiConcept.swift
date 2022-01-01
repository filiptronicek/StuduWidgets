//
//  ConfettiConcept.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 1/1/22.
//

import SwiftUI

struct ConfettiConcept: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    @State var buttonPressed:Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {},
                       label: {
                            Text("Confetti GO!")
                                .foregroundColor(Color.black)
                })
            }
            
            EmitterView()
                .scaleEffect(buttonPressed ? 1 : 0, anchor: .top)
                .opacity(!buttonPressed ? 1 : 0)
                .ignoresSafeArea()
        }
    }
}

struct EmitterView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .red
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = createEmitterCells()
        emitterLayer.emitterSize = CGSize(width: screenSize.width, height: 1)
        emitterLayer.emitterPosition = CGPoint(x: screenSize.width / 2, y: 0)
        
        view.layer.addSublayer(emitterLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func createEmitterCells() -> [CAEmitterCell] {
        var emitterCells: [CAEmitterCell] = []
        
        for index in 1...12 {
            let cell = CAEmitterCell()
            
            cell.contents = UIImage(named: "Rectangle")?.cgImage
            cell.color = UIColor.red.cgColor
            cell.birthRate = 4.5
            cell.lifetime = 20
            cell.velocity = 120
            cell.scale = 0.2
            cell.emissionLongitude = .pi
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 1
            
            emitterCells.append(cell)
        }
        
        return emitterCells
    }
}

struct ConfettiConcept_Previews: PreviewProvider {
    static var previews: some View {
        ConfettiConcept()
    }
}
