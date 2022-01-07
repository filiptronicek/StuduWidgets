//
//  HomeViewConcept.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/30/21.
//

import SwiftUI

struct HomeViewConcept: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    
    @State var offset: CGSize = .zero
    @State var showingSettings:Bool = false
    
    var body: some View {
        ZStack {
            model.bg.overlay(
                    Text("rest of the homeview")
                        .foregroundColor(model.fontClr)
                )
                .clipShape(LiquidShape(offset: offset))
                .overlay(
                    Image(systemName: "gearshape")
                        .font(.system(size: model.screenSize.width / 18))
                        .frame(width: model.screenSize.width / 8, height: model.screenSize.width / 8)
                        .contentShape(Rectangle())
                        .gesture(DragGesture().onChanged({ (value) in
                            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                                    offset = value.translation
                            }
                        }).onEnded({ (value) in
                            withAnimation(.spring()) {
                                if -offset.width > model.screenSize.width / 2 {
                                    offset.width = -model.screenSize.height
                                    showingSettings.toggle()
                                }
                                
                                else {
                                    offset = .zero
                                }
                            }
                        })
                        )
                        .foregroundColor(model.objectsClrDark)
                        .offset(x: model.screenSize.width / 50, y: model.screenSize.width / 3.6)
                        .opacity(offset == .zero ? 1 : 0),
                    alignment: .topTrailing
                )
                .ignoresSafeArea()
            
            if showingSettings == true {
                Text("show home")
                    .onTapGesture {
                        withAnimation(.spring()) {
                            offset = .zero
                            showingSettings.toggle()
                        }
                    }
            }
        }
    }
}

struct LiquidShape: Shape {
    
    var offset: CGSize
    
    var animatableData: CGSize.AnimatableData {
        get {return offset.animatableData}
        set {offset.animatableData = newValue}
    }
    
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
