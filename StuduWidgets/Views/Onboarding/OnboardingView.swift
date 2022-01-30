//
//  OnboardingView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 1/30/22.
//

import SwiftUI

struct OnboardingView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    @State private var tabSelection = 0
    
    var body: some View {
        ZStack {
            model.bg.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Button(action: {model.onboardingShown = true},
                       label: {
                            Text("Skip")
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 20))
                                .frame(width: model.screenSize.width / 1.3, alignment: .trailing)
                })
                
                TabView(selection: $tabSelection) {
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(model.objectsClrDark)
                                .frame(width: model.screenSize.width / 1.3, height: model.screenSize.width / 1.1)
                                .cornerRadius(model.screenSize.width / 28)
                            
                            VStack {
                                Text("Welcome to\n\t**StuduWidgets**")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 12))
                                
                                Image("StuduIcon")
                                    .resizable()
                                    .frame(width: model.screenSize.width / 4, height: model.screenSize.width / 4.1)
                                    .padding([.top], model.screenSize.width / 10)
                            }
                        }
                    }.tag(0)
                    
                    VStack {
                        Text("Jump to the app")
                            .foregroundColor(model.fontClr)
                    }.tag(1)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(width: model.screenSize.width, height: model.screenSize.width / 0.7)
                
                Spacer()
                
                Button(action: {
                            if tabSelection == 0 {
                                tabSelection = 1
                            }
                    
                            else {
                                model.onboardingShown = true
                            }
                        },
                       label: {
                            ZStack {
                                Rectangle()
                                    .fill(model.objectsClrDark)
                                    .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                    .cornerRadius(model.screenSize.width / 28)
                                
                                if tabSelection == 0 {
                                    Text("Continue")
                                        .foregroundColor(model.fontClr)
                                        .font(.system(size: model.screenSize.width / 17))
                                }
                                
                                else if tabSelection == 1 {
                                    Text("Proceed to the app")
                                        .foregroundColor(model.fontClr)
                                        .font(.system(size: model.screenSize.width / 17))
                                }
                            }
                }).padding([.bottom], model.screenSize.width / 20)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(ContentModel())
    }
}
