//
//  TimetableWidgetSmall.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 12/26/21.
//

import SwiftUI

let date = Date()
let calendar = Calendar.current
let hour = calendar.component(.hour, from: date)
let minutes = calendar.component(.minute, from: date)
let seconds = calendar.component(.second, from: date)

// ((hour * 3 600) + (minutes * 60) + seconds)
// 28,800 (number of seconds at 8am) / 338.823 = 85 (aka the offset we need at 8am)

struct TimetableWidgetSmall: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    
    @State private var xcor:CGFloat = 85 // TODO - Create conversion from time that corresponds to the right positioning (8:00 is the time when the first subject's hitbox (idk how to call it xd) should begin touching the cyan line
    
    var entry: SimpleEntry
    
    var body: some View {
        ZStack {
            model.bg
            
            Rectangle()
                .fill(model.objectClrBlue)
                .frame(width: screenSize.width / 300, height: screenSize.width)
            
            VStack {
                HStack {
                    ZStack {
                        Text("Ch")
                            .foregroundColor(model.fontClrDark)
                            .font(.system(size: screenSize.width / 10))
                            .padding([.top, .leading], screenSize.width / 60)
                        
                        Text("Ch")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: screenSize.width / 10))
                    }
                    
                    Rectangle()
                        .fill(model.fontClr)
                        .frame(width: screenSize.width / 150, height: screenSize.width / 15)
                    
                    ZStack {
                        Text("F")
                            .foregroundColor(model.fontClrDark)
                            .font(.system(size: screenSize.width / 10))
                            .padding([.top, .leading], screenSize.width / 60)
                        
                        Text("F")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: screenSize.width / 10))
                    }
                    
                    Rectangle()
                        .fill(model.fontClr)
                        .frame(width: screenSize.width / 150, height: screenSize.width / 15)
                    
                    ZStack {
                        Text("M")
                            .foregroundColor(model.fontClrDark)
                            .font(.system(size: screenSize.width / 10))
                            .padding([.top, .leading], screenSize.width / 60)
                        
                        Text("M")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: screenSize.width / 10))
                    }
                    
                    // TODO - Create child appending based on the number of subjects in a list
                    
                }.offset(x: xcor)
            }
        }
    }
}



