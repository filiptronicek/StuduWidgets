//
//  WidgetsView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/27/21.
//

import SwiftUI

struct WidgetsView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        ScrollView {
            VStack {
                // MARK: Get started section
                
                if !model.isSignedInToBakalari && !model.isSignedInToStrava {
                    Heading(text: "Get started")
                    
                    Text("For a widget to work, you need to **sign in** \nto a corresponding service...")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 25))
                        .frame(width: model.screenSize.width / 1.2, height: model.screenSize.width / 10)
                        .padding(.bottom, model.screenSize.width / 25)
                        .padding(.trailing, model.screenSize.width / 9)

                    HStack {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: model.screenSize.width / 20, height: model.screenSize.width / 20)
                            .foregroundColor(model.fontClr)
                                                            
                        Text("Open **Settings**")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 25))
                            .padding(.leading, model.screenSize.width / 30)
                        
                        Spacer()
                    }.padding(.top, model.screenSize.width / 40)
                        .frame(width: model.screenSize.width / 1.2, height: model.screenSize.width / 15)
                    
                    HStack {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: model.screenSize.width / 20, height: model.screenSize.width / 20)
                            .foregroundColor(model.fontClr)
                        
                        Text("Click on **Add account**")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 25))
                            .padding(.leading, model.screenSize.width / 30)
                        
                        Spacer()
                    }.padding(.top, model.screenSize.width / 50)
                        .frame(width: model.screenSize.width / 1.2, height: model.screenSize.width / 15)
                    
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: model.screenSize.width / 20, height: model.screenSize.width / 20)
                            .foregroundColor(model.fontClr)
                        
                        Text("**Sign in** to a service")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 25))
                            .padding(.leading, model.screenSize.width / 30)
                        
                        Spacer()
                    }.padding(.top, model.screenSize.width / 14)
                        .padding(.bottom, model.screenSize.width / 18)
                        .frame(width: model.screenSize.width / 1.2, height: model.screenSize.width / 15)
                }
                
                
                // MARK: Widgets section
                
                Heading(text: "Widgets")
                    .padding(.top, model.screenSize.width / 15)
                
                Button(action: {model.showingTimetableSheet.toggle()}, label: { WidgetCardLabel(heading: "Timetable Widget", bodyText: "~ let's you view timetable\non your Home Screen", imageLink: "TimetableWidget")
                }).sheet(isPresented: $model.showingTimetableSheet) {TimetableSheet()}
                
                Button(action: {model.showingLunchSheet.toggle()},
                       label: { WidgetCardLabel(heading: "Lunch Widget", bodyText: "~ let's you know whatcha gonna eat today", imageLink: "TimetableWidget")
                }).sheet(isPresented: $model.showingLunchSheet) {LunchSheet()}
            }
        }
    }
}

struct WidgetsView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetsView()
            .environmentObject(ContentModel())
    }
}