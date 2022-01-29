//
//  TimetableSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/19/21.
//

import SwiftUI

struct TimetableSheet: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    
    @State private var dividersAreNumbers:Bool = false
    
    var body: some View {
        ZStack {
            model.objectsClrDark.ignoresSafeArea()
            
            VStack {
                Title(text: "Timetable Widget")
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        Heading(text: "Customization")
                        
                        ZStack {
                            Rectangle()
                                .fill(model.objectsClrMedium)
                                .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                .cornerRadius(model.screenSize.width / 28)
                            
                            HStack {
                                Text("Morning message")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 20))
                                    .padding(.trailing, model.screenSize.width / 2.8)
                                
                                //TODO Textfield for input of the morning message
                            }
                        }
                        
                        ZStack {
                            Rectangle()
                                .fill(model.objectsClrMedium)
                                .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                .cornerRadius(model.screenSize.width / 28)
                            
                            HStack {
                                Text("Evening message")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 20))
                                    .padding(.trailing, model.screenSize.width / 2.8)
                                
                                //TODO Textfield for input of the evening message
                            }
                        }
                        
                        Button(action: {dividersAreNumbers.toggle()},
                               label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(model.objectsClrMedium)
                                            .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                            .cornerRadius(15)
                                        
                                        HStack {
                                            Text("Dividers")
                                                .foregroundColor(model.fontClr)
                                                .font(.system(size: model.screenSize.width / 20))
                                                .padding(.trailing, model.screenSize.width / 4.9)
                                            
                                            // I feel like this is a pixel off and moves when you click the dividers button
                                            
                                            if dividersAreNumbers == false {
                                                Text("Lines")
                                                    .foregroundColor(model.objectsClrLight)
                                                    .font(.system(size: model.screenSize.width / 20))
                                                    .padding(.leading, model.screenSize.width / 4.72)
                                            }
                                            
                                            else if dividersAreNumbers == true {
                                                Text("Numbers")
                                                    .foregroundColor(model.objectsClrLight)
                                                    .font(.system(size: model.screenSize.width / 20))
                                                    .padding(.leading, model.screenSize.width / 7.9)
                                            }
                                        }
                                    }
                        })
                    }
                    
                    Heading(text: "Get started")
                        .padding(.top, model.screenSize.width / 15)
                        .padding(.bottom, model.screenSize.width / 60)
                    
                    Text("TimeTable Widget lets you view your school subjects on Home Screen!")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 25))
                        .frame(width: model.screenSize.width / 1.1)
                    
                    HStack {
                        Text("Here's a quick preview!")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 25))
                            .padding(.trailing, model.screenSize.width / 25)
                        
                        Image("TimetableWidget")
                            .resizable()
                            .frame(width: model.screenSize.width / 2.7, height: model.screenSize.width / 3)
                    }.frame(width: model.screenSize.width / 1.2)
                        .padding([.top, .bottom], model.screenSize.width / 10)
                    
                    HStack {
                        Image("CustomTimetableWidget")
                            .resizable()
                            .frame(width: model.screenSize.width / 2.7, height: model.screenSize.width / 3)
                        
                        Text("The widget is customizable in the app. Make it yours!")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 25))
                            .padding(.leading, model.screenSize.width / 25)
                    }.frame(width: model.screenSize.width / 1.2)
                }
                
                Text("Swipe down")
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 18))
            }
        }
    }
}

struct TimetableSheet_Previews: PreviewProvider {
    static var previews: some View {
        TimetableSheet()
            .environmentObject(ContentModel())
    }
}
