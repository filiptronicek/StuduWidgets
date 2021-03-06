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
            model.Wbg
            
            Rectangle()
                .fill(model.WobjectClrBlue)
                .frame(width: model.screenSize.width / 300, height: model.screenSize.width)
            
            VStack {
                HStack {
                    ForEach(model.timetable, id: \.self) { subject in
                        ZStack {
                            Text(subject)
                                .foregroundColor(model.WfontClrDark)
                                .font(.system(size: model.screenSize.width / 10))
                                .padding([.top, .leading], model.screenSize.width / 60)
                            
                            Text(subject)
                                .foregroundColor(model.WfontClr)
                                .font(.system(size: model.screenSize.width / 10))
                        }
                        
                        Rectangle()
                            .fill(model.WfontClr)
                            .frame(width: model.screenSize.width / 150, height: model.screenSize.width / 25)
                    }
                }.frame(width: model.screenSize.width / 0.5, height: model.screenSize.width)
                    .offset(x: 100)
            }
        }
    }
}
