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
    
    var data: [String]
    var size: String
    
    var body: some View {
        if size == "Small" {
            ZStack {
                Rectangle()
                    .fill(model.Wbg)
                    .frame(width: model.screenSize.width / 2.5, height: model.screenSize.width / 2.5)
                    .cornerRadius(23)
                
                Rectangle()
                    .fill(model.WobjectClrBlue)
                    .frame(width: model.screenSize.width / 300, height: model.screenSize.width / 2.5)
                
                HStack {
                    ForEach(data, id: \.self) { subject in
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
                Rectangle()
                    .fill(model.Wbg)
                    .frame(width: model.screenSize.width / 1.2, height: model.screenSize.width / 2.5)
                    .cornerRadius(25)
                
                Rectangle()
                    .fill(model.WobjectClrBlue)
                    .frame(width: model.screenSize.width / 300, height: model.screenSize.width / 2.5)
                
                HStack {
                    ForEach(data, id: \.self) { subject in
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

struct TimetableWidgetPreview_Previews: PreviewProvider {
    static var previews: some View {
        TimetableWidgetPreview(data: ["Ch", "M"], size: "Small")
            .environmentObject(ContentModel())
    }
}


// MARK: LunchWidget

struct LunchWidgetPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var data: String
    var size: String
    
    var body: some View {
        if size == "Small" {
            ZStack {
                Rectangle()
                    .fill(model.WobjectsClrDark)
                    .frame(width: model.screenSize.width / 2.5, height: model.screenSize.width / 2.5)
                    .cornerRadius(23)
            
                HStack() {
                    Text(Date.now, format: .dateTime.day())
                        .foregroundColor(model.WfontClr)
                        .font(.system(size: model.screenSize.width / 10))
                    
                    Text(Date.now, format: .dateTime.weekday())
                        .foregroundColor(model.WfontClr)
                        .font(.system(size: model.screenSize.width / 20))
                }.padding([.bottom], model.screenSize.width / 5.5)
                
                VStack {
                    Text(data)
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
                    .frame(width: model.screenSize.width / 1.2, height: model.screenSize.width / 2.5)
                    .cornerRadius(25)
                
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
        } else {
            Text("Size not implemented")
        }
    }
}

struct LunchWidgetPreview_Previews: PreviewProvider {
    static var previews: some View {
        LunchWidgetPreview(data: "Kuřecí řízek, bramborová kaše", size: "Small")
            .environmentObject(ContentModel())
    }
}
