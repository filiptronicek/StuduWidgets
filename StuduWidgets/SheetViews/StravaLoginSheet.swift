//
//  StravaLoginSheet.swift
//  StuduWidgets
//
//  Created by Filip on 26.12.2021.
//

import SwiftUI

struct StravaLoginSheet: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var canteen: String = ""
    @State private var token: String = "No token"
    @State private var statusFontColor: Color = fontClr

    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            objectsClrDark.ignoresSafeArea()
            
            VStack {
                Text("Strava login")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 12))
                    .padding(.trailing, screenSize.width / 3.02)
                    .padding([.top, .bottom], screenSize.width / 18)
                
                ScrollView {
                    VStack {
                        TextField("Username", text: $username)
                            .padding()
                            .background(objectsClrLight)
                            .foregroundColor(fontClr)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .padding(.horizontal, screenSize.width / 10)
                        SecureField("Password", text: $password)
                            .padding()
                            .background(objectsClrLight)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .padding(.horizontal, screenSize.width / 10)
                        TextField("Canteen", text: $canteen)
                            .padding()
                            .background(objectsClrLight)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .padding(.horizontal, screenSize.width / 10)
                        Button("Log in", action: {
                            statusFontColor = fontClr
                            token = "Loading the token"
                            
                            if (canteen == "" || username == "" || password == "") {
                                statusFontColor = Color(red: 1, green: 0, blue: 0)
                                token = "Missing fields"
                                return
                            }
                            
                            Task {
                                let tokenResp = await model.getStravaToken(username: username, password: password, canteen: canteen)
                                if tokenResp != nil {
                                    token = tokenResp!
                                    statusFontColor = Color(red: 0, green: 1, blue: 0)
                                } else {
                                    statusFontColor = Color(red: 1, green: 0, blue: 0)
                                    token = "Error getting the token"
                                }
                            }
                        }
                        ).buttonStyle(.bordered)
                        Text(token).foregroundColor(statusFontColor)

                    }
                }
                
                Text("Swipe down to cancel")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 18))
            }
        }
    }
}

struct StravaLoginSheet_Previews: PreviewProvider {
    static var previews: some View {
        StravaLoginSheet()
    }
}
