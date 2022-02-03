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
    @State private var tokenOutput: String = "No token"
    
    @ObservedObject var userSettings = ContentModel.UserSettings()

    var body: some View {
        ZStack {
            model.objectsClrDark.ignoresSafeArea()
            
            VStack {
                Title(text: "Strava.cz login")
                
                ScrollView {
                    VStack {
                        TextField("Username", text: $userSettings.stravaUsername)
                            .padding()
                            .background(model.objectsClrLight)
                            .foregroundColor(model.fontClr)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .padding(.horizontal, model.screenSize.width / 10)
                        SecureField("Password", text: $userSettings.stravaPassword)
                            .padding()
                            .background(model.objectsClrLight)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .padding(.horizontal, model.screenSize.width / 10)
                        TextField("Canteen", text: $userSettings.stravaCanteen)
                            .padding()
                            .background(model.objectsClrLight)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .padding(.horizontal, model.screenSize.width / 10)
                        Button("Log in", action: {
                            statusFontColor = model.fontClr
                            tokenOutput = "Loading the token"
                            
                            if (userSettings.stravaCanteen == "" || userSettings.stravaUsername == "" || userSettings.stravaPassword == "") {
                                statusFontColor = Color(red: 1, green: 0, blue: 0)
                                tokenOutput = "Missing fields"
                                return
                            }
                            
                            Task {
                                let tokenResp = await model.getStravaToken(username: userSettings.stravaUsername, password: userSettings.stravaPassword, canteen: userSettings.stravaCanteen)
                                if tokenResp != nil {
                                    userSettings.stravaToken = tokenResp!
                                    tokenOutput = "Signed in successfully"
                                    statusFontColor = Color(red: 0, green: 1, blue: 0)
                                } else {
                                    statusFontColor = Color(red: 1, green: 0, blue: 0)
                                    tokenOutput = "Error getting the token"
                                }
                            }
                        }
                        ).buttonStyle(.bordered)
                        Text(tokenOutput).foregroundColor(statusFontColor) // TODO - add confetti effect after successful login
                        Text(userSettings.stravaToken!).foregroundColor(statusFontColor) // TODO - add confetti effect after successful login

                    }
                }
                
                Text("Swipe down to cancel")
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 18))
            }
        }
    }
}

struct StravaLoginSheet_Previews: PreviewProvider {
    static var previews: some View {
        StravaLoginSheet()
            .environmentObject(ContentModel())
    }
}
