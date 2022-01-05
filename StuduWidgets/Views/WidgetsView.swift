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
                        .font(.system(size: screenSize.width / 15))
                        .padding(.trailing, screenSize.width / 1.8)
                        .padding(.bottom, screenSize.width / 60)
                    
                    Text("For a widget to work, you need to **sign in** \nto a corresponding service...")
                        .foregroundColor(model.fontClr)
                        .font(.system(size: screenSize.width / 25))
                        .frame(width: screenSize.width / 1.2, height: screenSize.width / 10)
                        .padding(.bottom, screenSize.width / 25)
                        .padding(.trailing, screenSize.width / 9)

                    HStack {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: screenSize.width / 20, height: screenSize.width / 20)
                            .foregroundColor(model.fontClr)
                                                            
                        Text("Open **Settings**")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: screenSize.width / 25))
                            .padding(.leading, screenSize.width / 30)
                        
                        Spacer()
                    }.padding(.top, screenSize.width / 40)
                        .frame(width: screenSize.width / 1.2, height: screenSize.width / 15)
                    
                    HStack {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: screenSize.width / 20, height: screenSize.width / 20)
                            .foregroundColor(model.fontClr)
                        
                        Text("Click on **Add account**")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: screenSize.width / 25))
                            .padding(.leading, screenSize.width / 30)
                        
                        Spacer()
                    }.padding(.top, screenSize.width / 50)
                        .frame(width: screenSize.width / 1.2, height: screenSize.width / 15)
                    
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: screenSize.width / 20, height: screenSize.width / 20)
                            .foregroundColor(model.fontClr)
                        
                        Text("**Sign in** to a service")
                            .foregroundColor(model.fontClr)
                            .font(.system(size: screenSize.width / 25))
                            .padding(.leading, screenSize.width / 30)
                        
                        Spacer()
                    }.padding(.top, screenSize.width / 14)
                        .padding(.bottom, screenSize.width / 18)
                        .frame(width: screenSize.width / 1.2, height: screenSize.width / 15)
                }
                
                Text("Widgets")
                    .foregroundColor(model.objectsClrLight)
                    .font(.system(size: screenSize.width / 15))
                    .padding(.trailing, screenSize.width / 1.6)
                    .padding(.top, screenSize.width / 18)
                
                Button(action: {model.showingTimetableSheet.toggle()}, label: {
                        ZStack {
                            Rectangle()
                                .fill(model.objectsClrDark)
                                .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                .cornerRadius(15)
                            
                            HStack {
                                Text("Timetable Widget")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: screenSize.width / 16))
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: screenSize.width / 30, height: screenSize.width / 20)
                                    .padding(.leading, screenSize.width / 5.95)
                                    .foregroundColor(Color.gray)
                            }
                        }
                }).sheet(isPresented: $model.showingTimetableSheet) {TimetableSheet()}
                
                Button(action: {model.showingLunchSheet.toggle()},
                       label: {
                            ZStack {
                                Rectangle()
                                    .fill(model.objectsClrDark)
                                    .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                    .cornerRadius(15)
                                
                                HStack {
                                    Text("Lunch Widget")
                                        .foregroundColor(model.fontClr)
                                        .font(.system(size: screenSize.width / 16))
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .frame(width: screenSize.width / 30, height: screenSize.width / 20)
                                        .padding(.leading, screenSize.width / 3.75)
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
    }
}
