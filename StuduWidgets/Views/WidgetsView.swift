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
                if !model.isSignedInToBakalari && !model.isSignedInToStrava {
                    Text("Get started")
                        .foregroundColor(model.objectsClrLight)
                        .font(.system(size: model.screenSize.width / 15))
                        .padding(.trailing, model.screenSize.width / 1.8)
                        .padding(.bottom, model.screenSize.width / 60)
                    
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
                
                Text("Widgets")
                    .foregroundColor(model.objectsClrLight)
                    .font(.system(size: model.screenSize.width / 15))
                    .padding(.trailing, model.screenSize.width / 1.6)
                    .padding(.top, model.screenSize.width / 18)
                
                Button(action: {model.showingTimetableSheet.toggle()}, label: {
                        ZStack {
                            Rectangle()
                                .fill(model.objectsClrDark)
                                .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 3)
                                .cornerRadius(model.screenSize.width / 28)
                            
                            HStack {
                                Image("TimetableWidget")
                                    .resizable()
                                    .frame(width: model.screenSize.width / 6, height: model.screenSize.width / 6.3)
                                
                                VStack {
                                    Text("Timetable Widget")
                                        .foregroundColor(model.fontClr)
                                        .font(.system(size: model.screenSize.width / 16))
                                    
                                    Text("~ let's you view timetable on \nyour Home Screen")
                                        .foregroundColor(model.fontClr)
                                        .font(.system(size: model.screenSize.width / 25))
                                }
                                
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: model.screenSize.width / 30, height: model.screenSize.width / 20)
                                    .padding(.leading, model.screenSize.width / 25)
                                    .foregroundColor(Color.gray)
                            }
                        }
                }).sheet(isPresented: $model.showingTimetableSheet) {TimetableSheet()}
                
                Button(action: {model.showingLunchSheet.toggle()},
                       label: {
                            ZStack {
                                Rectangle()
                                    .fill(model.objectsClrDark)
                                    .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                    .cornerRadius(model.screenSize.width / 28)
                                
                                HStack {
                                    Text("Lunch Widget")
                                        .foregroundColor(model.fontClr)
                                        .font(.system(size: model.screenSize.width / 16))
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .frame(width: model.screenSize.width / 30, height: model.screenSize.width / 20)
                                        .padding(.leading, model.screenSize.width / 3.75)
                                        .foregroundColor(Color.gray)
                                }
                            }
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
