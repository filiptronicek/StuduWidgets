//
//  HomeViewConcept.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/30/21.
//

import SwiftUI

struct HomeViewConcept: View {
    @State var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            bg.overlay(
                    Text("rest of the homeview")
                        .foregroundColor(fontClr)
                )
                .clipShape(LiquidShape(offset: offset))
                .overlay(
                    Image(systemName: "gearshape")
                        .font(.system(size: screenSize.width / 18))
                        .frame(width: screenSize.width / 8, height: screenSize.width / 8)
                        .contentShape(Rectangle())
                        .gesture(DragGesture().onChanged({ (value) in
                            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                                    offset = value.translation
                            }
                        }).onEnded({ (value) in
                            
                        })
                        )
                        .foregroundColor(objectsClrDark)
                        .offset(x: screenSize.width / 50, y: screenSize.width / 3.6),
                    alignment: .topTrailing
                )
                .ignoresSafeArea()
        }
    }
}

struct LiquidShape: Shape {
    
    var offset: CGSize
    
    func path(in rect: CGRect) -> Path {
        return Path {path in
            let width = rect.width + (-offset.width > 0 ? offset.width: 0)
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let from = 80 + (offset.width)
            path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80: from))
            
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180: to
            
            let mid: CGFloat = 80 + ((to - 80) / 2)
            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - 50, y: mid), control2: CGPoint(x: width - 50, y: mid))
        }
    }
}

struct HomeViewConcept_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewConcept()
    }
}
