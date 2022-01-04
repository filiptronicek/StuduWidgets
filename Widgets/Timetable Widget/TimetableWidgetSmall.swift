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

struct TimetableWidgetSmall: View {
    @State private var xcor:CGFloat = 50
    
    var entry: SimpleEntry
    
    var body: some View {
        ZStack {
            bg
            
            Rectangle()
                .fill(objectClrBlue)
                .frame(width: screenSize.width / 300, height: screenSize.width)
            
            VStack {
                HStack {
                    ZStack {
                        Text("Ch")
                            .foregroundColor(fontClrDark)
                            .font(.system(size: screenSize.width / 10))
                            .padding([.top, .leading], screenSize.width / 60)
                        
                        Text("Ch")
                            .foregroundColor(fontClr)
                            .font(.system(size: screenSize.width / 10))
                    }
                    
                    Rectangle()
                        .fill(fontClr)
                        .frame(width: screenSize.width / 150, height: screenSize.width / 15)
                    
                    ZStack {
                        Text("F")
                            .foregroundColor(fontClrDark)
                            .font(.system(size: screenSize.width / 10))
                            .padding([.top, .leading], screenSize.width / 60)
                        
                        Text("F")
                            .foregroundColor(fontClr)
                            .font(.system(size: screenSize.width / 10))
                    }
                    
                    Rectangle()
                        .fill(fontClr)
                        .frame(width: screenSize.width / 150, height: screenSize.width / 15)
                    
                    ZStack {
                        Text("M")
                            .foregroundColor(fontClrDark)
                            .font(.system(size: screenSize.width / 10))
                            .padding([.top, .leading], screenSize.width / 60)
                        
                        Text("M")
                            .foregroundColor(fontClr)
                            .font(.system(size: screenSize.width / 10))
                    }
                }.offset(x: xcor)
            }
        }
    }
}



