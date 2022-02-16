//
//  BakalariLoginSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 2/3/22.
//

import SwiftUI

struct BakalariLoginSheet: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel

    @State private var statusFontColor: Color = Color.white
    @State private var tokenOutput: String = "Unknown"
    
    @ObservedObject var userSettings = ContentModel.UserSettings()

    var body: some View {
        ZStack {
            model.objectsClrDark.ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack {
                        
                        TextField("Bakaláři endpoint", text: $userSettings.bakalariEndpoint)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding()
                            .background(model.objectsClrLight)
                            .foregroundColor(model.fontClr)
                            .cornerRadius(model.screenSize.width / 28)
                            .padding([.top], model.screenSize.width / 4)
                            .padding(.bottom, 20)
                            .padding(.horizontal, model.screenSize.width / 10)
                        
                        TextField("Username", text: $userSettings.bakalariUsername)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding()
                            .background(model.objectsClrLight)
                            .foregroundColor(model.fontClr)
                            .cornerRadius(model.screenSize.width / 28)
                            .padding(.bottom, 20)
                            .padding(.horizontal, model.screenSize.width / 10)
                        
                        SecureField("Password", text: $userSettings.bakalariPassword)
                            .padding()
                            .background(model.objectsClrLight)
                            .cornerRadius(model.screenSize.width / 28)
                            .padding(.bottom, 20)
                            .padding(.horizontal, model.screenSize.width / 10)

                        HStack {
                            Circle()
                                .fill(statusFontColor)
                                .frame(width: model.screenSize.width / 40, height: model.screenSize.width / 40)
                            
                            Text("Status: ")
                                .foregroundColor(model.objectsClrLight)
                                .font(.system(size: model.screenSize.width / 25))
                            
                            Text(tokenOutput)
                                .foregroundColor(model.fontClr) // TODO - add confetti effect after successful login
                        }
                        
                        Button(action: {
                                    statusFontColor = Color(red: 1, green: 203 / 255, blue: 107 / 255)
                                    tokenOutput = "Loading..."
                                    userSettings.bakalariRefreshToken = "0"
                                    
                                    if (userSettings.bakalariEndpoint == "" || userSettings.bakalariUsername == "" || userSettings.bakalariPassword == "") {
                                        statusFontColor = Color(red: 252 / 255, green: 98 / 255, blue: 98 / 255)
                                        tokenOutput = "Missing fields"
                                        return
                                    }
                                    
                                    model.getBakalariToken(username: userSettings.bakalariUsername, password: userSettings.bakalariPassword, endpoint: userSettings.bakalariEndpoint, userCompletionHandler: { data, error in
                                        if let data = data {
                                            if data.ok {
                                                DispatchQueue.main.async {
                                                    userSettings.bakalariAccessToken = (data.accessToken!)
                                                    userSettings.bakalariRefreshToken = data.refreshToken!
                                                    tokenOutput = "Signed in successfully"
                                                    model.showingLoginBakalari = false
                                                    statusFontColor = Color(red: 98 / 255, green: 252 / 255, blue: 98 / 255)
                                                }
                                            } else {
                                                statusFontColor = Color(red: 252 / 255, green: 98 / 255, blue: 98 / 255)
                                                tokenOutput = "\(data.errorMessage ?? "Error getting the token")"
                                            }
                                        } else {
                                            if let error = error {
                                                statusFontColor = Color(red: 252 / 255, green: 98 / 255, blue: 98 / 255)
                                                tokenOutput = "Error getting the token: \(error.localizedDescription)"
                                            }
                                        }
                                      })
                                },
                               label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(model.objectsClrMedium)
                                            .frame(width: model.screenSize.width / 2, height: model.screenSize.width / 8)
                                            .cornerRadius(model.screenSize.width / 28)
                                    
                                        Text("Log in")
                                            .foregroundColor(model.fontClr)
                                            .font(.system(size: model.screenSize.width / 17))
                                            .frame(width: model.screenSize.width / 1.6, height: model.screenSize.width / 8, alignment: .center)
                                    }
                        })
                        
                    }
                }
            }
            
            VStack {
                ZStack {
                    Title(text: "Bakaláři login")
                    
                    VStack() {
                        Button(action: { model.showingLoginBakalari.toggle()},
                               label: {
                                    Text("Cancel")
                                        .padding([.bottom], model.screenSize.width / 25)
                        })
                    }.frame(width: model.screenSize.width / 1.15, alignment: .trailing)
                }
                
                Spacer()
            }.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                SheetFooter()
            }.ignoresSafeArea()
        }
    }
}

struct BakalariLoginSheet_Previews: PreviewProvider {
    static var previews: some View {
        BakalariLoginSheet()
    }
}
