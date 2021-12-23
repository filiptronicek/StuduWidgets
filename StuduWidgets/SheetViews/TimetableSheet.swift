//
//  TimetableSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/19/21.
//

import SwiftUI

struct TimetableSheet: View {
    
    @State private var dividersAreNumbers:Bool = false
    
    
    func getStravaToken (username: String, password: String, canteen: String) {
        let url = URL(string: "https://strava-api.vercel.app/api/auth/token?username=\(username)&password=\(password)&canteen=\(canteen)")
        guard let requestUrl = url else { fatalError() }

        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
            
        }.resume()
    
    }
    
    var body: some View {
        ZStack {
            objectsClrDark.ignoresSafeArea()
            
            VStack {
                Text("Timetable Widget")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 12))
                    .padding(.trailing, screenSize.width / 5)
                    .padding([.top, .bottom], screenSize.width / 18)
                
                ScrollView {
                    VStack {
                        Text("Customization")
                            .foregroundColor(objectsClrLight)
                            .font(.system(size: screenSize.width / 15))
                            .padding(.trailing, screenSize.width / 4.2)
                        
                        ZStack {
                            Rectangle()
                                .fill(objectsClrMedium)
                                .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                .cornerRadius(15)
                            
                            HStack {
                                Text("Morning message")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 20))
                                    .padding(.trailing, screenSize.width / 2.8)
                                
                                //TODO Textfield for input of the morning message
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(objectsClrMedium)
                                .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                .cornerRadius(15)
                            
                            HStack {
                                Text("Evening message")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 20))
                                    .padding(.trailing, screenSize.width / 2.8)
                                
                                //TODO Textfield for input of the evening message
                            }
                        }
                        Button(action: {dividersAreNumbers.toggle()},
                               label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(objectsClrMedium)
                                            .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                            .cornerRadius(15)
                                        
                                        HStack {
                                            Text("Dividers")
                                                .foregroundColor(fontClr)
                                                .font(.system(size: screenSize.width / 20))
                                                .padding(.trailing, screenSize.width / 4.9)
                                            
                                            // I feel like this is a pixel off and moves when you click the dividers button
                                            
                                            if dividersAreNumbers == false {
                                                Text("Lines")
                                                    .foregroundColor(objectsClrLight)
                                                    .font(.system(size: screenSize.width / 20))
                                                    .padding(.leading, screenSize.width / 4.72)
                                            }
                                            
                                            else if dividersAreNumbers == true {
                                                Text("Numbers")
                                                    .foregroundColor(objectsClrLight)
                                                    .font(.system(size: screenSize.width / 20))
                                                    .padding(.leading, screenSize.width / 7.9)
                                            }
                                        }
                                    }
                        })
                    }
                }
                
                Text("Swipe down")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 18))
            }
        }
    }
}

struct TimetableSheet_Previews: PreviewProvider {
    static var previews: some View {
        TimetableSheet()
    }
}
