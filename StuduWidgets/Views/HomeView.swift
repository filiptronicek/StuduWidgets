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
            
            VStack {
                // MARK: Heading and views
                
                Text("StuduWidgets")
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 10))
                    .padding(.trailing, model.screenSize.width / 5)
                    .padding([.top, .bottom], model.screenSize.width / 18)
                
                if !model.showingSettings {
                    WidgetsView()
                }
                
                else {
                    SettingsView()
                }
                
                
                // MARK: Navigation menu
                
                ZStack {
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
                    }.padding(.bottom, model.screenSize.width / 20)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
