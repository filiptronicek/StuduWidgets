//
//  TimetableWidgetSmall.swift
//  Timetable WidgetExtension
//
//  Created by Rostislav Brož on 12/26/21.
//

import WidgetKit
import SwiftUI

struct TimetableWidgetSmall: View {
    
    @State private var xcor:CGFloat = 100
    @State private var ycor:CGFloat = 200
    
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
                }.position(x: xcor, y: ycor)
            }
        }
    }
}
