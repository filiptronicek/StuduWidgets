//
//  TimetableWidgetSmall.swift
//  Timetable WidgetExtension
//
//  Created by Rostislav Brož on 12/26/21.
//

import WidgetKit
import SwiftUI

struct TimetableWidgetSmall: View {
    var entry: SimpleEntry
    
    var body: some View {
        ZStack {
            bg
            
            Rectangle()
                .fill(objectClrBlue)
                .frame(width: screenSize.width / 300, height: screenSize.width)
            
            VStack {
                HStack {
                    Spacer()
                    
                    ZStack {
                        Text("Ch")
                            .foregroundColor(fontClrDark)
                            .font(.system(size: screenSize.width / 10))
                            .padding([.top, .leading], screenSize.width / 60)
                        
                        Text("Ch")
                            .foregroundColor(fontClr)
                            .font(.system(size: screenSize.width / 10))
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Text("F")
                            .foregroundColor(fontClrDark)
                            .font(.system(size: screenSize.width / 10))
                            .padding([.top, .leading], screenSize.width / 60)
                        
                        Text("F")
                            .foregroundColor(fontClr)
                            .font(.system(size: screenSize.width / 10))
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Text("M")
                            .foregroundColor(fontClrDark)
                            .font(.system(size: screenSize.width / 10))
                            .padding([.top, .leading], screenSize.width / 60)
                        
                        Text("M")
                            .foregroundColor(fontClr)
                            .font(.system(size: screenSize.width / 10))
                    }
                }
            }
        }
    }
}
