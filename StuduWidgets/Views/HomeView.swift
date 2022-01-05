//
//  HomeView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/18/21.
//

import SwiftUI


// declaration of a constant from which screen width and height is accessed to properly position and size objects

let screenSize: CGRect = UIScreen.main.bounds

struct HomeView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel

    
    var body: some View {
        ZStack {
            model.bg.ignoresSafeArea()
            
            VStack {
                Text("StuduWidgets")
                    .foregroundColor(model.fontClr)
                    .font(.system(size: screenSize.width / 10))
                    .padding(.trailing, screenSize.width / 5)
                    .padding([.top, .bottom], screenSize.width / 18)
                
                if !model.showingSettings {
                    SettingsView()
                }
                
                else {
                    WidgetsView()
                }
                
                ZStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {model.showingSettings = false}, label: {
                            VStack {
                                Image(systemName: model.showingSettings ? "square.text.square" : "square.text.square.fill")
                                    .resizable()
                                    .frame(width: screenSize.width / 18, height: screenSize.width / 18)
                                    .foregroundColor(model.fontClr)
                                
                                Text("Widgets")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: screenSize.width / 30))
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {model.showingSettings = true}, label: {
                            VStack {
                                Image(systemName: model.showingSettings ? "gearshape.fill" : "gearshape")
                                    .resizable()
                                    .frame(width: screenSize.width / 18, height: screenSize.width / 18)
                                    .foregroundColor(model.fontClr)
                                
                                Text("Settings")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: screenSize.width / 30))
                            }
                        })
                        
                        Spacer()
                    }.padding(.bottom, screenSize.width / 20)
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
