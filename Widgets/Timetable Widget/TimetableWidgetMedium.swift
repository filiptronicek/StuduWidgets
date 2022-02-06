//
//  TimetableWidgetMedium.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 12/26/21.
//

import WidgetKit
import SwiftUI

struct TimetableWidgetMedium: View {
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
                        Text(model.timetableTuesday[0])
                            .foregroundColor(model.fontClrDark)
                            .font(.system(size: model.screenSize.width / 8))
                            .padding([.top, .leading], model.screenSize.width / 60)
                        
                        Text(model.timetableTuesday[0])
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 8))
                    }
                    
                    Rectangle()
                        .fill(model.fontClr)
                        .frame(width: model.screenSize.width / 150, height: model.screenSize.width / 10)
                        .padding([.vertical], model.screenSize.width / 8)
                    
                    ZStack {
                        Text(model.timetableTuesday[1])
                            .foregroundColor(model.fontClrDark)
                            .font(.system(size: model.screenSize.width / 8))
                            .padding([.top, .leading], model.screenSize.width / 60)
                        
                        Text(model.timetableTuesday[1])
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 8))
                    }
                    
                    Rectangle()
                        .fill(model.fontClr)
                        .frame(width: model.screenSize.width / 150, height: model.screenSize.width / 10)
                    
                    ZStack {
                        Text(model.timetableTuesday[2])
                            .foregroundColor(model.fontClrDark)
                            .font(.system(size: model.screenSize.width / 8))
                            .padding([.top, .leading], model.screenSize.width / 60)
                        
                        Text(model.timetableTuesday[2])
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 8))
                    }
                    
                    Rectangle()
                        .fill(model.fontClr)
                        .frame(width: model.screenSize.width / 150, height: model.screenSize.width / 10)
                    
                    ZStack {
                        Text(model.timetableTuesday[3])
                            .foregroundColor(model.fontClrDark)
                            .font(.system(size: model.screenSize.width / 8))
                            .padding([.top, .leading], model.screenSize.width / 60)
                        
                        Text(model.timetableTuesday[3])
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 8))
                    }
                    
                    // TODO - Create child appending based on the number of subjects in a list
                    
                }.frame(width: model.screenSize.width / 0.5, height: model.screenSize.width)
                    .offset(x: 100)
            }
        }
    }
}
