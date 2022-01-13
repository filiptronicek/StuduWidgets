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
            model.bg.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("<Date>")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 10))
                    
                    Image(systemName: "fork.knife.circle")
                        .resizable()
                        .frame(width: model.screenSize.width / 10, height: model.screenSize.width / 10)
                        .foregroundColor(model.fontClrDark)
                }
            }
        }
    }
}
