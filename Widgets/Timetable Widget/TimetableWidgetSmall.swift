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
    
    
    var entry: SimpleEntry
    
    var body: some View {
        ZStack {
            model.bg
            
            Rectangle()
                .fill(model.objectClrBlue)
                .frame(width: model.screenSize.width / 300, height: model.screenSize.width)
            
            VStack {
                HStack {
                    ZStack {
                        Text("Ch")
                            .foregroundColor(model.fontClrDark)
                            .font(.system(size: model.screenSize.width / 10))
                            .padding([.top, .leading], model.screenSize.width / 60)
                        
                        Text("Ch")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 10))
                    }
                    
                    Rectangle()
                        .fill(model.fontClr)
                        .frame(width: model.screenSize.width / 150, height: model.screenSize.width / 15)
                    
                    ZStack {
                        Text("F")
                            .foregroundColor(model.fontClrDark)
                            .font(.system(size: model.screenSize.width / 10))
                            .padding([.top, .leading], model.screenSize.width / 60)
                        
                        Text("F")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 10))
                    }
                    
                    Rectangle()
                        .fill(model.fontClr)
                        .frame(width: model.screenSize.width / 150, height: model.screenSize.width / 15)
                    
                    ZStack {
                        Text("M")
                            .foregroundColor(model.fontClrDark)
                            .font(.system(size: model.screenSize.width / 10))
                            .padding([.top, .leading], model.screenSize.width / 60)
                        
                        Text("M")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 10))
                    }
                    
                    // TODO - Create child appending based on the number of subjects in a list
                    
                }.offset(x: model.xcor)
            }
        }
    }
}



