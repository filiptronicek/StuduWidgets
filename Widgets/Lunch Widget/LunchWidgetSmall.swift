//
//  LunchWidgetSmall.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 1/6/22.
//

import SwiftUI

struct LunchWidgetSmall: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var entry: SimpleEntry
    
    var body: some View {
        ZStack {
            model.WobjectsClrDark.ignoresSafeArea()
        
            HStack() {
                Text(Date.now, format: .dateTime.day())
                    .foregroundColor(model.WfontClr)
                    .font(.system(size: model.screenSize.width / 10))
                
                Text(Date.now, format: .dateTime.weekday())
                    .foregroundColor(model.WfontClr)
                    .font(.system(size: model.screenSize.width / 20))
            }.padding([.bottom], model.screenSize.width / 5.5)
            
            VStack {
                Text(model.currentLunch)
                    .foregroundColor(model.WfontClr)
                    .font(.system(size: model.screenSize.width / 28))
                    .frame(width: model.screenSize.width / 3.2, height: model.screenSize.width / 6)
                    .padding([.horizontal], model.screenSize.width / 40)
                    .background(
                        Rectangle()
                            .fill(model.WobjectsClrMedium)
                            .cornerRadius(model.screenSize.width / 28)
                    )
            }.padding([.top], model.screenSize.width / 6.3)
        }
    }
}
