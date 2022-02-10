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
                ScrollView(showsIndicators: false) {
                    VStack {
                        Heading(text: "Get started")
                            .padding(.top, model.screenSize.width / 5)
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
                        }.padding(.bottom, model.screenSize.width / 5)
                            .frame(width: model.screenSize.width / 1.2)
                    }
                }
            }
            
            VStack {
                ZStack {
                    Title(text: "Timetable Widget")
                    
                    VStack() {
                        Button(action: { model.showingTimetableSheet.toggle()},
                               label: {
                                    Text("Cancel")
                                        .padding([.bottom], model.screenSize.width / 25)
                        })
                    }.frame(width: model.screenSize.width / 1.15, alignment: .trailing)
                }
                
                Spacer()
            }.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                SheetFooter()
            }.ignoresSafeArea()
        }
    }
}

struct TimetableSheet_Previews: PreviewProvider {
    static var previews: some View {
        TimetableSheet()
            .environmentObject(ContentModel())
    }
}
