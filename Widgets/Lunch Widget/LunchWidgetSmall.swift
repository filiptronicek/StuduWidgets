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
            model.objectsClrDark.ignoresSafeArea()
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Monday")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 25))
                        
                        Text("07")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 15))
                    }
                    
                    Image(systemName: "fork.knife.circle")
                        .resizable()
                        .frame(width: model.screenSize.width / 10, height: model.screenSize.width / 10)
                        .foregroundColor(model.objectsClrLight)
                }
                
                Text(model.currentLunch)
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 28))
                    .frame(width: model.screenSize.width / 3, height: model.screenSize.width / 6)
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
