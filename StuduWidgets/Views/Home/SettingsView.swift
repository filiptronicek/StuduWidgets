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
        
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    // MARK: Accounts section
                    
                    Heading(text: "Accounts")
                    
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
                            
                        if model.isSignedInToStrava {
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
                                            
                                            Text("Strava")
                                                .foregroundColor(model.objectsClrLight)
                                                .font(.system(size: model.screenSize.width / 25))
                                        }
                                        
                                        Spacer()
                                    }
                                }.contextMenu {
                                    Button(role: .destructive,
                                           action: {
                                                model.isSignedInToStrava = false
                                            },
                                           
                                           label: {
                                                Label("Sign out", systemImage: "trash")
                                    })
                                }
                            }
                            
                            Menu {
                                if !model.isSignedInToBakalari {
                                    Button (action: {
                                                // Todo(ft): add sign in action
                                                model.isSignedInToBakalari = true
                                            },
                                            
                                            label: {
                                                Label("Sign in to Bakaláři.cz", systemImage: "graduationcap")
                                    })
                                }
                                
                                if !model.isSignedInToStrava {
                                    Button (action: {
                                                // Todo(ft): add sign in action
                                                model.isSignedInToStrava = true
                                            },
                                            label: {
                                                Label("Sign in to Strava.cz", systemImage: "fork.knife")
                                    })
                                }
                            } label: {
                                    ZStack {
                                        if !(model.isSignedInToStrava && model.isSignedInToBakalari) {

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
                            }
                        }
                    
                    
                    // MARK: Color theme section

                    Heading(text: "Color theme")
                        .padding(.top, model.screenSize.width / 15)
                    
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
                                    .frame(width: model.screenSize.width / 20, height: model.screenSize.width / 20)
                                    .foregroundColor(model.objectsClrLight)
                                    
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
                                Text("Light (lamer)")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 18))
                                    .frame(width: model.screenSize.width / 1.5, height: model.screenSize.width / 8, alignment: .leading)
                                    
                                
                                Image(systemName: model.darkThemeIsActive ? "" : "checkmark")
                                    .resizable()
                                    .frame(width: model.screenSize.width / 20, height: model.screenSize.width / 20)
                                    .foregroundColor(model.objectsClrLight)
                                    
                            }
                        }
                    })
                    
                    
                    // MARK: Information section
                    
                    Heading(text: "Information")
                        .padding(.top, model.screenSize.width / 15)
                    
                    Button(action: {model.showingNewsSheet.toggle()},
                           label: {ButtonLabel(text: "What's coming?")
                    }).sheet(isPresented: $model.showingNewsSheet) {NewsSheet()}
                    
                    Button(action: {model.showingDataSheet.toggle()},
                           label: {ButtonLabel(text: "Data handling")
                    }).sheet(isPresented: $model.showingDataSheet) {DataSheet()}
                }
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
