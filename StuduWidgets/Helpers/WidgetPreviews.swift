//
//  WidgetPreviews.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 2/10/22.
//

import SwiftUI


// MARK: TimetableWidget

struct TimetableWidgetPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: [String]
    var size: String
    
    var body: some View {
        if size == "Small" {
            ZStack {
                HStack {
                    ForEach(mockData, id: \.self) { subject in
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
                            .frame(width: model.screenSize.width / 150, height: model.screenSize.width / 15)
                    }
                }
            }
        } else if size == "Medium" {
            ZStack {
                HStack {
                    ForEach(mockData, id: \.self) { subject in
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
                            .frame(width: model.screenSize.width / 150, height: model.screenSize.width / 15)
                    }
                }
            }
        } else {
            Text("Size not implemented")
        }
    }
}


// MARK: LunchWidget

struct LunchWidgetPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: String
    var size: String
    
    var body: some View {
        if size == "Small" {
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
        } else if size == "Medium" {
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
        } else {
            Text("Size not implemented")
        }
    }
}
