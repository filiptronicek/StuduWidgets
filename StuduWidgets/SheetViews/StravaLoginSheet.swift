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

    var body: some View {
        ZStack {
            objectsClrDark.ignoresSafeArea()
            
            VStack {
                Text("Log in to Strava.cz")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 12))
                    .padding(.trailing, screenSize.width / 3.02)
                    .padding([.top, .bottom], screenSize.width / 18)
                
                ScrollView {
                    VStack {
                        TextField("Username", text: $username)
                            .padding()
                            .background(objectsClrLight)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                        SecureField("Password", text: $password)
                            .padding()
                            .background(objectsClrLight)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                        TextField("Canteen", text: $canteen)
                            .padding()
                            .background(objectsClrLight)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                    }
                }
                
                Text("Swipe down")
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
