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
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var canteen: String = ""
    @State private var token: String = "No token"
    @State private var statusFontColor: Color = Color.white
    
    var body: some View {
        ZStack {
            model.objectsClrDark.ignoresSafeArea()
            
            VStack {
                Title(text: "Strava.cz login")
                
                ScrollView {
                    VStack {
                        TextField("Username", text: $username)
                            .padding()
                            .background(model.objectsClrLight)
                            .foregroundColor(model.fontClr)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .padding(.horizontal, model.screenSize.width / 10)
                        SecureField("Password", text: $password)
                            .padding()
                            .background(model.objectsClrLight)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .padding(.horizontal, model.screenSize.width / 10)
                        TextField("Canteen", text: $canteen)
                            .padding()
                            .background(model.objectsClrLight)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .padding(.horizontal, model.screenSize.width / 10)
                        Button("Log in", action: {
                            statusFontColor = model.fontClr
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
                        Text(token).foregroundColor(statusFontColor) // TODO - add confetti effect after successful login

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
