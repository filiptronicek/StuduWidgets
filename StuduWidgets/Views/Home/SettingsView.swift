//
//  SettingsView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/27/21.
//

import SwiftUI

struct SettingsView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    @ObservedObject var userSettings = ContentModel.UserSettings()

    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    // MARK: Accounts
                    
                    Heading(text: "Accounts")
                        .padding(.top, model.screenSize.width / 5)
                    
                    VStack {
                        if userSettings.bakalariRefreshToken != "" {
                            UserProfileCard(service: .bakalari, description: "Bakaláři.cz")
                        }
                            
                        if userSettings.stravaToken != "" {
                            UserProfileCard(service: .strava, description: "Strava.cz")
                        }
                                
                        if !(userSettings.stravaToken != "" && userSettings.bakalariRefreshToken != "") {
                            Menu {
                                if userSettings.bakalariRefreshToken == "" {
                                    Button(action: {
                                                // Todo(ft): add sign in action
                                                model.showingLoginBakalari = true
                                            },
                                            
                                            label: {
                                                Label("Sign in to Bakaláři.cz", systemImage: "graduationcap")
                                    })
                                }
                                
                                if userSettings.stravaToken == "" {
                                    Button(action: {
                                                model.showingLoginStrava = true
                                            },
                                            label: {
                                                Label("Sign in to Strava.cz", systemImage: "fork.knife")
                                    })
                                }
                            } label: {
                                ZStack {
                                    Rectangle()
                                            .fill(model.objectsClrDark)
                                        .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                        .cornerRadius(model.screenSize.width / 28)
                                    
                                    HStack {
                                        Image(systemName: "plus")
                                            .resizable()
                                            .foregroundColor(Color.blue)
                                            .frame(width: model.screenSize.width / 20, height: model.screenSize.width / 20)
                                        
                                        Text("Add account")
                                            .foregroundColor(Color.blue)
                                            .font(.system(size: model.screenSize.width / 18))
                                    }
                                }
                            }.sheet(isPresented: $model.showingLoginStrava) {StravaLoginSheet()}
                            .sheet(isPresented: $model.showingLoginBakalari) {BakalariLoginSheet()}
                        }
                    }
                    
                    
                    // MARK: General

                    Heading(text: "General")
                        .padding(.top, model.screenSize.width / 15)
                    
                    Group {
                        Button(action: {
                                    withAnimation {
                                        model.darkThemeIsActive.toggle()
                            
                                        model.changeColorTheme()
                                    }
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .fill(model.objectsClrDark)
                                    .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                    .cornerRadius(model.screenSize.width / 28)
                                
                                Text("Appearance")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 17))
                                    .frame(width: model.screenSize.width / 1.4, height: model.screenSize.width / 8, alignment: .leading)
                                        
                                if model.darkThemeIsActive {
                                    Group {
                                        Text("Dark")
                                            .foregroundColor(model.objectsClrLight)
                                            .font(.system(size: model.screenSize.width / 20))
                                    }.frame(width: model.screenSize.width / 1.5, height: model.screenSize.width / 8, alignment: .trailing)
                                } else {
                                    Group {
                                        Text("Light")
                                            .foregroundColor(model.objectsClrLight)
                                            .font(.system(size: model.screenSize.width / 20))
                                    }.frame(width: model.screenSize.width / 1.5, height: model.screenSize.width / 8, alignment: .trailing)
                                }
                            }
                        })
                    }
                    
                    
                    // MARK: Information
                    
                    Heading(text: "Information")
                        .padding(.top, model.screenSize.width / 15)
                    
                    Group {
                        Button(action: {model.showingNewsSheet.toggle()},
                               label: {ButtonLabel(text: "What's coming?")
                        }).sheet(isPresented: $model.showingNewsSheet) {NewsSheet()}
                        
                        Link(destination: URL(string: "https://github.com/filiptronicek/StuduWidgets/blob/main/docs/PRIVACY.md")!,
                             label: {
                                ZStack {
                                    Rectangle()
                                        .fill(model.objectsClrDark)
                                        .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                        .cornerRadius(model.screenSize.width / 28)
                                
                                    Text("Privacy policy")
                                        .foregroundColor(model.fontClr)
                                        .font(.system(size: model.screenSize.width / 17))
                                        .frame(width: model.screenSize.width / 1.4, height: model.screenSize.width / 8, alignment: .leading)
                                    
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable()
                                        .foregroundColor(model.objectsClrLight)
                                        .frame(width: model.screenSize.width / 20, height: model.screenSize.width / 16)
                                        .padding(.leading, model.screenSize.width / 1.5)
                                }
                        })
                        
                        Heading(text: "Help")
                            .padding(.top, model.screenSize.width / 15)
                        
                        Button(action: {model.showingFeedbackSheet.toggle()},
                               label: {ButtonLabel(text: "Feedback")
                        }).sheet(isPresented: $model.showingFeedbackSheet) {FeedbackSheet()}
                        
                        Button(action: {model.showingHelpSheet.toggle()},
                               label: {ButtonLabel(text: "Help")
                        }).sheet(isPresented: $model.showingHelpSheet) {HelpSheet()}
                        
                        Button(action: {},
                               label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(model.easterEggClr)
                                            .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                            .cornerRadius(model.screenSize.width / 28)
                                        
                                        Text("Version")
                                            .foregroundColor(model.fontClr)
                                            .font(.system(size: model.screenSize.width / 17))
                                            .frame(width: model.screenSize.width / 1.4, alignment: .leading)
                                        
                                        Text("1.0")
                                            .foregroundColor(model.objectsClrLight)
                                            .font(.system(size: model.screenSize.width / 18))
                                            .frame(width: model.screenSize.width / 1.4, alignment: .trailing)
                                    }
                        }).simultaneousGesture(LongPressGesture(minimumDuration: 2).onEnded { _ in
                            model.easterEggClr = Color(red: 0 / 255, green: 255 / 255, blue: 240 / 255)
                        })
                    }
                }.padding(.bottom, model.screenSize.width / 3)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(ContentModel())
    }
}
