//
//  NavigationMenu.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 3/12/22.
//

import SwiftUI

struct NavigationMenu: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Button(action: {
                            withAnimation {
                                model.showingSettings = 0
                            }
                        },
                       label: {
                            VStack {
                                if model.showingSettings == 0 {
                                    Image(systemName: "square.text.square.fill")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                        .foregroundColor(model.fontClr)
                                } else {
                                    Image(systemName: "square.text.square")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                        .foregroundColor(model.fontClr)
                                }
                                
                                Text("Widgets")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 30))
                            }
                })
                
                Spacer()
                
                Button(action: {
                            withAnimation {
                                model.showingSettings = 1
                            }
                        },
                       label: {
                            VStack {
                                if model.showingSettings == 1 {
                                    Image(systemName: "gearshape.fill")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                        .foregroundColor(model.fontClr)
                                } else {
                                    Image(systemName: "gearshape")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                        .foregroundColor(model.fontClr)
                                }
                                
                                Text("Settings")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 30))
                            }
                })
                
                Spacer()
            }.padding([.bottom], model.screenSize.width / 11)
                .background(
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(stops: [.init(color: model.bg.opacity(0.01), location: 0), .init(color: model.bg, location: 1)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: model.screenSize.width, height: model.screenSize.width / 3)
                        .padding([.bottom], model.screenSize.width / 12)
                        .blur(radius: 5, opaque: false)
                )
        }.ignoresSafeArea()
    }
}

struct NavigationMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMenu()
            .environmentObject(ContentModel())
    }
}
