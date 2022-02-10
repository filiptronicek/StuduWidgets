//
//  WidgetPreviews.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 2/10/22.
//

import SwiftUI


// MARK: TimetableWidget small

struct TimetableWidgetSmallPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: [String]
    
    var body: some View {
        Text("Hello, World!")
    }
}


// MARK: TimetableWidget medium

struct TimetableWidgetMediumPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: [String]
    
    var body: some View {
        Text("Hello, World!")
    }
}


// MARK: LunchWidget small

struct LunchWidgetSmallPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(model.WobjectsClrDark)
                .frame(width: model.screenSize.width / 4.5, height: model.screenSize.width / 4.5)
                .cornerRadius(15)
        
            HStack() {
                Text(Date.now, format: .dateTime.day())
                    .foregroundColor(model.WfontClr)
                    .font(.system(size: model.screenSize.width / 10))
                
                Text(Date.now, format: .dateTime.weekday())
                    .foregroundColor(model.WfontClr)
                    .font(.system(size: model.screenSize.width / 20))
            }.padding([.bottom], model.screenSize.width / 5.5)
            
            VStack {
                Text(mockData)
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


// MARK: LunchWidget medium

struct LunchWidgetMediumPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: String
    
    var body: some View {
        Text("Hello, World!")
    }
}
