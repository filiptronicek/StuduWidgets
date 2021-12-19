//
//  LaunchView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/18/21.
//

import SwiftUI


// declaration of a constant from which screen width and height is accessed to properly position and size objects

let screenSize: CGRect = UIScreen.main.bounds


// declaration of UI colors

public var bg = Color(red: 0.05, green: 0, blue: 0)
public var objectsClr = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
public var fontClr = Color(red: 1, green: 1, blue: 1)



struct ContentView: View {
    var body: some View {
        ZStack {
            bg.ignoresSafeArea()
            
            VStack {
                Text("StuduWidgets")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 10))
                    .padding(.trailing, screenSize.width / 5)
                    .padding([.top, .bottom], screenSize.width / 18)
                
                ScrollView {
                    VStack {
                        Button(action: {}, label: {
                            ZStack {
                                Rectangle()
                                    .fill(objectsClr)
                                    .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                    .cornerRadius(15)
                                
                                HStack {
                                    Text("Timetable Widget")
                                        .foregroundColor(fontClr)
                                        .font(.system(size: screenSize.width / 16))
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .frame(width: screenSize.width / 30, height: screenSize.width / 20)
                                        .padding(.leading, screenSize.width / 6)
                                        .foregroundColor(Color.gray)
                                }
                            }
                        })
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
