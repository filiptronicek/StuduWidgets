//
//  LunchWidgetMedium.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 1/6/22.
//

import SwiftUI

struct LunchWidgetMedium: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var entry: SimpleEntry
    
    var body: some View {
        ZStack {
            model.WobjectsClrDark.ignoresSafeArea()
            
            ZStack {
                VStack(alignment: .center) {
                    Text(Date.now, format: .dateTime.weekday())
                        .foregroundColor(model.WfontClr)
                        .font(.system(size: model.screenSize.width / 18))
                    
                    Text(Date.now, format: .dateTime.day())
                        .foregroundColor(model.WfontClr)
                        .font(.system(size: model.screenSize.width / 7))
                }.padding([.trailing], model.screenSize.width / 1.87)
                
                Group {
                    Text(model.currentLunch)
                        .foregroundColor(model.WfontClr)
                        .font(.system(size: model.screenSize.width / 28))
                        .frame(width: model.screenSize.width / 2, height: model.screenSize.width / 4)
                        .background(
                            Rectangle()
                                .fill(model.WobjectsClrMedium)
                                .cornerRadius(model.screenSize.width / 28)
                        )
                }.padding([.leading], model.screenSize.width / 3.7)
            }
        }
    }
}
