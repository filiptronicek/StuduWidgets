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

public var bg = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
public var fontClr = Color(red: 1, green: 1, blue: 1)



struct ContentView: View {
    var body: some View {
        ZStack {
            bg.ignoresSafeArea()
            
            VStack {
                Text("Widgets")
                    .foregroundColor(fontClr)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
