//
//  StravaLoginView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/30/21.
//

import SwiftUI

struct StravaLoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var canteen: String = ""
    @State private var token: String = "No token"
    
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
                            token = "Loading the token"
                            Task {
                                let tokenResp = await model.getStravaToken(username: username, password: password, canteen: canteen)
                                if tokenResp != nil {
                                    token = tokenResp!
                                } else {
                                    token = "Error getting the token"
                                }
                            }
                        }
                        ).buttonStyle(.bordered)
                        Text(token)
                    }
                }
                
                Text("Swipe down to cancel")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 18))
            }
        }
    }
}

}

struct StravaLoginView_Previews: PreviewProvider {
    static var previews: some View {
        StravaLoginView()
    }
}
