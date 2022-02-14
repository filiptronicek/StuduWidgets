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
    @ObservedObject var userSettings = ContentModel.UserSettings()

    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                VStack {
                    // MARK: Get started section
                    
                    if userSettings.bakalariRefreshToken == "" && userSettings.stravaToken == "" {
                        Heading(text: "Get started")
                            .padding(.top, model.screenSize.width / 5)
                        
                        Text("For a widget to work, you need to **sign in** \nto a corresponding service...")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: model.screenSize.width / 25))
                            .frame(width: model.screenSize.width / 1.2, height: model.screenSize.width / 10)
                            .padding(.bottom, model.screenSize.width / 25)
                            .padding(.trailing, model.screenSize.width / 9)
                        
                        ItemList(text: "Open Settings", icon: "gearshape").padding(.top, model.screenSize.width / 40)
                                        .frame(width: model.screenSize.width / 1.5, height: model.screenSize.width / 15, alignment: .leading)
                       
                        ItemList(text: "Click on Add account", icon: "plus").padding(.top, model.screenSize.width / 50)
                                    .frame(width: model.screenSize.width / 1.5, height: model.screenSize.width / 15, alignment: .leading)
                        
                        ItemList(text: "Sign in to a service", icon: "person.circle").padding(.top, model.screenSize.width / 14)
                                            .padding(.bottom, model.screenSize.width / 18)
                                            .frame(width: model.screenSize.width / 1.5, height: model.screenSize.width / 15, alignment: .leading)
                    }
                    
                    
                    // MARK: Widgets section
                    
                    Heading(text: "Widgets")
                        .padding(.top, model.screenSize.width / 5)
                    
                    Button(action: {model.showingTimetableSheet.toggle()}, label: { WidgetCardLabel(heading: "Timetable Widget", bodyText: "~ let's you view timetable\non your Home Screen", imageLink: "TimetableWidget")
                    }).sheet(isPresented: $model.showingTimetableSheet) {TimetableSheet()}
                    
                    Button(action: {model.showingLunchSheet.toggle()},
                           label: { WidgetCardLabel(heading: "Lunch Widget", bodyText: "~ let's you know whatcha gonna eat today", imageLink: "LunchWidget")
                    }).sheet(isPresented: $model.showingLunchSheet) {LunchSheet()}
                }.padding(.bottom, model.screenSize.width / 3)
                
                if userSettings.bakalariRefreshToken == "" && userSettings.stravaToken == "" {
                    Text("Swipe left ->")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: model.screenSize.width / 18))
                        .padding([.bottom], model.screenSize.width / 3.2)
                }
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
