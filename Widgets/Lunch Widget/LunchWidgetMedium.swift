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
            model.objectsClrDark.ignoresSafeArea()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Monday")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 20))
                    
                    Text("07")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 10))
                }.padding([.horizontal], model.screenSize.width / 40)
                
                Text(model.currentLunch)
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 28))
                    .frame(width: model.screenSize.width / 2.2, height: model.screenSize.width / 4)
                    .padding([.horizontal], model.screenSize.width / 40)
                    .background(
                        Rectangle()
                            .fill(model.objectsClrMedium)
                            .cornerRadius(model.screenSize.width / 28)
                    )
            }
        }
    }
}
