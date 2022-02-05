//
//  HomeView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/18/21.
//

import SwiftUI

struct HomeView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            model.bg.ignoresSafeArea()
            
            
            // MARK: Heading and views
            
            if !model.showingSettings {
                WidgetsView()
            }
            
            else {
                SettingsView()
            }
            
            VStack {
                Text("StuduWidgets")
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 10))
                    .frame(width: model.screenSize.width, height: model.screenSize.width / 5)
                    .padding(.trailing, model.screenSize.width / 5)
                    .padding([.top, .bottom], model.screenSize.width / 18)
                    .background(Rectangle()
                                    .fill(LinearGradient(gradient: Gradient(stops: [.init(color: model.bg, location: 0), .init(color: model.bg.opacity(0.01), location: 1)]), startPoint: .top, endPoint: .bottom)))
                
                Spacer()
            }.ignoresSafeArea()
            
                
            // MARK: Navigation menu
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {model.showingSettings = false}, label: {
                        VStack {
                            Image(systemName: model.showingSettings ? "square.text.square" : "square.text.square.fill")
                                .resizable()
                                .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                .foregroundColor(model.fontClr)
                            
                            Text("Widgets")
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 30))
                        }
                    })
                    
                    Spacer()
                    
                    Button(action: {model.showingSettings = true}, label: {
                        VStack {
                            Image(systemName: model.showingSettings ? "gearshape.fill" : "gearshape")
                                .resizable()
                                .frame(width: model.screenSize.width / 18, height: model.screenSize.width / 18)
                                .foregroundColor(model.fontClr)
                            
                            Text("Settings")
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 30))
                        }
                    })
                    
                    Spacer()
                }.padding([.bottom], model.screenSize.width / 12)
                    .background(Rectangle()
                                    .fill(LinearGradient(gradient: Gradient(stops: [.init(color: model.bg.opacity(0.001), location: 0), .init(color: model.bg, location: 1)]), startPoint: .top, endPoint: .bottom)))
            }.ignoresSafeArea()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
