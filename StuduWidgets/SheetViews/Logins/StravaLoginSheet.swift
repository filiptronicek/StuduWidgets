//
//  StravaLoginSheet.swift
//  StuduWidgets
//
//  Created by Filip on 26.12.2021.
//

import SwiftUI

struct StravaLoginSheet: View {
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
                        TextField("Username", text: $userSettings.stravaUsername)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding()
                            .background(model.objectsClrLight)
                            .foregroundColor(model.fontClr)
                            .cornerRadius(model.screenSize.width / 28)
                            .padding([.top], model.screenSize.width / 4)
                            .padding(.bottom, 20)
                            .padding(.horizontal, model.screenSize.width / 10)
                        
                        SecureField("Password", text: $userSettings.stravaPassword)
                            .padding()
                            .background(model.objectsClrLight)
                            .cornerRadius(model.screenSize.width / 28)
                            .padding(.bottom, 20)
                            .padding(.horizontal, model.screenSize.width / 10)
                        
                        TextField("Canteen", text: $userSettings.stravaCanteen)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
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
                                    
                                    if (userSettings.stravaCanteen == "" || userSettings.stravaUsername == "" || userSettings.stravaPassword == "") {
                                        statusFontColor = Color(red: 252 / 255, green: 98 / 255, blue: 98 / 255)
                                        tokenOutput = "Missing fields"
                                        return
                                    }
                                    
                                    Task {
                                        let tokenResp = await model.getStravaToken(username: userSettings.stravaUsername, password: userSettings.stravaPassword, canteen: userSettings.stravaCanteen)
                                        if tokenResp.ok {
                                            userSettings.stravaToken = tokenResp.token!
                                            userSettings.stravaDisplayName = tokenResp.displayName!
                                            tokenOutput = "Signed in successfully"
                                            model.showingLoginStrava = false
                                            statusFontColor = Color(red: 98 / 255, green: 252 / 255, blue: 98 / 255)
                                        } else {
                                            statusFontColor = Color(red: 252 / 255, green: 98 / 255, blue: 98 / 255)
                                            tokenOutput = "Error getting the token: \(tokenResp.errorMessage ?? "")"
                                        }
                                    }
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
                        
                        Text(userSettings.stravaDisplayName).foregroundColor(Color.white)
                    }
                }
            }
            
            VStack {
                ZStack {
                    Title(text: "Strava.cz login")
                    
                    VStack() {
                        Button(action: { model.showingLoginStrava.toggle()},
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

struct StravaLoginSheet_Previews: PreviewProvider {
    static var previews: some View {
        StravaLoginSheet()
            .environmentObject(ContentModel())
    }
}
