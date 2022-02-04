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
                    // MARK: Accounts section
                    
                    Heading(text: "Accounts")
                        .padding(.top, model.screenSize.width / 5)
                    
                    VStack {
                        if model.isSignedInToBakalari {
                            ZStack {
                                Rectangle()
                                    .fill(model.objectsClrDark)
                                    .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 4)
                                    .cornerRadius(model.screenSize.width / 28)
                                
                                HStack {
                                    Spacer()
                                    
                                    Image("frightened")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 5.5, height: model.screenSize.width / 5.5)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(model.fontClr, lineWidth: model.screenSize.width / 150))
                                        .padding(.trailing, model.screenSize.width / 50)
                                    
                                    VStack {
                                        Text("Rostislav Brož")
                                            .foregroundColor(model.fontClr)
                                            .font(.system(size: model.screenSize.width / 18))
                                        
                                        Text("Bakalari")
                                            .foregroundColor(model.objectsClrLight)
                                            .font(.system(size: model.screenSize.width / 25))
                                    }
                                    
                                    Spacer()
                                }
                            }.contextMenu {
                                Button(role: .destructive,
                                       action: {
                                            model.isSignedInToBakalari = false
                                        },
                                       
                                       label: {
                                            Label("Sign out", systemImage: "trash")
                                })
                            }
                        }
                            
                        if userSettings.stravaToken != "" {
                                ZStack {
                                    Rectangle()
                                        .fill(model.objectsClrDark)
                                        .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 4)
                                        .cornerRadius(model.screenSize.width / 28)
                                    
                                    HStack {
                                        Spacer()
                                        
                                        Image("frightened")
                                            .resizable()
                                            .frame(width: model.screenSize.width / 5.5, height: model.screenSize.width / 5.5)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(model.fontClr, lineWidth: model.screenSize.width / 150))
                                            .padding(.trailing, model.screenSize.width / 50)
                                        
                                        VStack {
                                            Text(userSettings.stravaDisplayName)
                                                .foregroundColor(model.fontClr)
                                                .font(.system(size: model.screenSize.width / 18))
                                            
                                            Text("Strava")
                                                .foregroundColor(model.objectsClrLight)
                                                .font(.system(size: model.screenSize.width / 25))
                                        }
                                        
                                        Spacer()
                                    }
                                }.contextMenu {
                                    Button(role: .destructive,
                                           action: {
                                                userSettings.stravaToken = ""
                                                userSettings.stravaDisplayName = ""
                                            },
                                           
                                           label: {
                                                Label("Sign out", systemImage: "trash")
                                    })
                                }
                            }
                            
                            Menu {
                                if !model.isSignedInToBakalari {
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
                                        if !(userSettings.stravaToken != "" && model.isSignedInToBakalari) {

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
                                }
                            }.sheet(isPresented: $model.showingLoginStrava) {StravaLoginSheet()}
                            .sheet(isPresented: $model.showingLoginBakalari) {BakalariLoginSheet()}
                        }
                    
                    
                    // MARK: Color theme section

                    Heading(text: "Color theme")
                        .padding(.top, model.screenSize.width / 15)
                    
                    Group {
                        Button(action: {
                                    model.darkThemeIsActive = true
                            
                                    model.changeColorTheme()
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .fill(model.objectsClrDark)
                                    .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                    .cornerRadius(model.screenSize.width / 28)
                                HStack {
                                    Text("Dark (default)")
                                        .foregroundColor(model.fontClr)
                                        .font(.system(size: model.screenSize.width / 18))
                                        .frame(width: model.screenSize.width / 1.5, height: model.screenSize.width / 8, alignment: .leading)
                                        
                                    
                                    Image(systemName: model.darkThemeIsActive ? "checkmark" : "")
                                        .resizable()
                                        .foregroundColor(model.objectsClrLight)
                                        .frame(width: model.screenSize.width / 20, height: model.screenSize.width / 20)
                                }
                            }
                        })
                        
                        Button(action: {
                                    model.darkThemeIsActive = false
                                
                                    model.changeColorTheme()
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .fill(model.objectsClrDark)
                                    .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                    .cornerRadius(model.screenSize.width / 28)
                                HStack {
                                    Text("Light (lame)")
                                        .foregroundColor(model.fontClr)
                                        .font(.system(size: model.screenSize.width / 18))
                                        .frame(width: model.screenSize.width / 1.5, height: model.screenSize.width / 8, alignment: .leading)
                                        
                                    
                                    Image(systemName: model.darkThemeIsActive ? "" : "checkmark")
                                        .resizable()
                                        .foregroundColor(model.objectsClrLight)
                                        .frame(width: model.screenSize.width / 20, height: model.screenSize.width / 20)
                                }
                            }
                        })
                    }
                    
                    
                    // MARK: Information section
                    
                    Heading(text: "Information")
                        .padding(.top, model.screenSize.width / 15)
                    
                    Group {
                        Button(action: {model.showingNewsSheet.toggle()},
                               label: {ButtonLabel(text: "What's coming?")
                        }).sheet(isPresented: $model.showingNewsSheet) {NewsSheet()}
                        
                        Button(action: {model.showingTermsSheet.toggle()},
                               label: {ButtonLabel(text: "Terms and Conditions")
                        }).sheet(isPresented: $model.showingTermsSheet) {TermsSheet()}
                        
                        Heading(text: "Help")
                            .padding(.top, model.screenSize.width / 15)
                        
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
                        
                        Button(action: {model.showingHelpSheet.toggle()},
                               label: {ButtonLabel(text: "Help")
                        }).sheet(isPresented: $model.showingHelpSheet) {HelpSheet()}
                    }
                }.padding(.bottom, model.screenSize.width / 5)
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
