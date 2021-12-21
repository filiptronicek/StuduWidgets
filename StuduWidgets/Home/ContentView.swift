//
//  HomeView.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/18/21.
//

import SwiftUI


// declaration of a constant from which screen width and height is accessed to properly position and size objects

let screenSize: CGRect = UIScreen.main.bounds


// declare vars for UI colors

public var bg = Color(red: 0.05, green: 0, blue: 0)
public var objectsClrDark = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
public var objectsClrLight = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
public var fontClr = Color(red: 1, green: 1, blue: 1)



struct HomeView: View {
    
    // declare state variables for sheets
    
    @State private var showingTimetableSheet:Bool = false
    @State private var showingLunchSheet:Bool = false
    @State private var showingComingSoon:Bool = false
    
    var body: some View {
        ZStack {
            bg.ignoresSafeArea()
            
            VStack {
                Text("StuduWidgets")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 10))
                    .padding(.trailing, screenSize.width / 5)
                    .padding([.top, .bottom], screenSize.width / 18)
                
                if showingComingSoon == false {
                    ScrollView {
                        VStack {
                            Button(action: {showingTimetableSheet.toggle()}, label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(objectsClrDark)
                                            .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                            .cornerRadius(15)
                                        
                                        HStack {
                                            Text("Timetable Widget")
                                                .foregroundColor(fontClr)
                                                .font(.system(size: screenSize.width / 16))
                                            Image(systemName: "chevron.right")
                                                .resizable()
                                                .frame(width: screenSize.width / 30, height: screenSize.width / 20)
                                                .padding(.leading, screenSize.width / 6)
                                                .foregroundColor(Color.gray)
                                        }
                                    }
                            }).sheet(isPresented: $showingTimetableSheet) {TimetableSheet()}
                            
                            Button(action: {showingLunchSheet.toggle()},
                                   label: {
                                        ZStack {
                                            Rectangle()
                                                .fill(objectsClrDark)
                                                .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                                .cornerRadius(15)
                                            
                                            HStack {
                                                Text("Lunch Widget")
                                                    .foregroundColor(fontClr)
                                                    .font(.system(size: screenSize.width / 16))
                                                Image(systemName: "chevron.right")
                                                    .resizable()
                                                    .frame(width: screenSize.width / 30, height: screenSize.width / 20)
                                                    .padding(.leading, screenSize.width / 3.75)
                                                    .foregroundColor(Color.gray)
                                            }
                                        }
                            }).sheet(isPresented: $showingLunchSheet) {LunchSheet()}
                        }
                    }
                }
                
                else {
                    VStack {
                        ScrollView {
                            VStack {
                                HStack {
                                      Spacer()
                                      
                                      Text("Accounts")
                                          .foregroundColor(objectsClrLight)
                                          .font(.system(size: screenSize.width / 15))
                                      
                                      Spacer()
                                      Spacer()
                                      Spacer()
                                      Spacer()
                                  }
                                
                                ZStack {
                                    Rectangle()
                                        .fill(objectsClrDark)
                                        .frame(width: screenSize.width / 1.1, height: screenSize.width / 4)
                                        .cornerRadius(15)
                                }
                                
                                Button(action: {},
                                       label: {
                                            ZStack {
                                                Rectangle()
                                                    .fill(objectsClrDark)
                                                    .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                                    .cornerRadius(15)
                                                
                                                HStack {
                                                    Image(systemName: "plus")
                                                        .resizable()
                                                        .foregroundColor(Color.blue)
                                                        .frame(width: screenSize.width / 20, height: screenSize.width / 20)
                                                    
                                                    Text("Add account")
                                                        .foregroundColor(Color.blue)
                                                        .font(.system(size: screenSize.width / 18))
                                                }
                                            }
                                })
                                
                                Button(action: {},
                                       label: {
                                            ZStack {
                                                Rectangle()
                                                    .fill(objectsClrDark)
                                                    .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                                    .cornerRadius(15)
                                                
                                                Text("Log out")
                                                    .foregroundColor(Color.red)
                                                    .font(.system(size: screenSize.width / 18))
                                            }
                                })
                            }
                        }
                    }
                }
                
                ZStack {
                    Rectangle()
                        .fill(objectsClrDark)
                        .frame(width: screenSize.width, height: screenSize.width / 6)
                        .ignoresSafeArea()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {showingComingSoon = false}, label: {
                            VStack {
                                Image(systemName: showingComingSoon ? "greetingcard" : "greetingcard.fill")
                                    .resizable()
                                    .frame(width: screenSize.width / 18, height: screenSize.width / 18)
                                    .foregroundColor(fontClr)
                                
                                Text("Widgets")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 30))
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {showingComingSoon = true}, label: {
                            VStack {
                                Image(systemName: showingComingSoon ? "gearshape.fill" : "gearshape")
                                    .resizable()
                                    .frame(width: screenSize.width / 18, height: screenSize.width / 18)
                                    .foregroundColor(fontClr)
                                
                                Text("Settings")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 30))
                            }
                        })
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
