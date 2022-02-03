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
                
                TabView(selection: $tabSelection) {
                    VStack {
                        VStack {
                            Text("Welcome to\n\t**StuduWidgets**")
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 12))
                        }
                    }.tag(0)
                    
                    VStack {
                        Text("Privacy policy")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 12))
                            .frame(width: model.screenSize.width / 1.4, alignment: .leading)
                        
                        Text("bla bla")
                            .foregroundColor(model.fontClr)
                    }.tag(1)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(width: model.screenSize.width, height: model.screenSize.width / 0.6)
                
                Spacer()
                
                Button(action: {
                            if tabSelection == 0 {
                                tabSelection = 1
                            }
                    
                            else {
                                model.showingPrivacyPopUp = true
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
                                    Text("Continue")
                                        .foregroundColor(model.fontClr)
                                        .font(.system(size: model.screenSize.width / 17))
                                }
                            }
                }).padding([.bottom], model.screenSize.width / 20)
                    .alert("By proceeding you accept our Privacy Policy", isPresented: $model.showingPrivacyPopUp) {
                        Button("Cancel", role: .cancel) {}
                    
                        Button(action: {model.onboardingShown = true}, label: {Text("Accept")})
                }
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
