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
public var objectsClrMedium = Color(red: 0.2266, green: 0.2266, blue: 0.2266)
public var objectsClrLight = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
public var fontClr = Color(red: 1, green: 1, blue: 1)



struct HomeView: View {
    
    // declare state variables for sheets
    
    @State private var showingTimetableSheet:Bool = false
    @State private var showingLunchSheet:Bool = false
    @State private var showingSettings:Bool = false
    @State private var isSignedIn:Bool = false
    
    var body: some View {
        ZStack {
            bg.ignoresSafeArea()
            
            VStack {
                Text("StuduWidgets")
                    .foregroundColor(fontClr)
                    .font(.system(size: screenSize.width / 10))
                    .padding(.trailing, screenSize.width / 5)
                    .padding([.top, .bottom], screenSize.width / 18)
                
                if showingSettings == false {
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
                                
                                if isSignedIn == true {
                                    ZStack {
                                        Rectangle()
                                            .fill(objectsClrDark)
                                            .frame(width: screenSize.width / 1.1, height: screenSize.width / 4)
                                            .cornerRadius(15)
                                        
                                        HStack {
                                            Spacer()
                                            
                                            Image("frightened")
                                                .resizable()
                                                .frame(width: screenSize.width / 5.5, height: screenSize.width / 5.5)
                                                .clipShape(Circle())
                                                .overlay(Circle().stroke(fontClr, lineWidth: screenSize.width / 150))
                                                .padding(.trailing, screenSize.width / 50)
                                            
                                            VStack {
                                                Text("Rostislav Brož")
                                                    .foregroundColor(fontClr)
                                                    .font(.system(size: screenSize.width / 18))
                                                
                                                Text("Gymnázium J. K. Tyla")
                                                    .foregroundColor(objectsClrLight)
                                                    .font(.system(size: screenSize.width / 25))
                                            }
                                            
                                            Spacer()
                                        }
                                    }.contextMenu{
                                        Button (role: .destructive) {
                                            isSignedIn = false
                                        } label: {
                                            Label("Sign out", systemImage: "trash")
                                        }
                                    }
                                }
                                
                                else {
                                    Menu {
                                        Button {
                                            // Todo(ft): add sign in action
                                            isSignedIn = true
                                        } label: {
                                            Label("Add a Bakaláři account", systemImage: "graduationcap")
                                        }
                                        Button {
                                            // Todo(ft): add sign in action
                                            isSignedIn = true
                                        } label: {
                                            Label("Add a Strava.cz account", systemImage: "fork.knife")
                                        }                                    } label: {
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
                                    }
                                }
                                
                                Button(action: {isSignedIn = false},
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
                                
                                HStack {
                                      Spacer()
                                      
                                      Text("Customization")
                                          .foregroundColor(objectsClrLight)
                                          .font(.system(size: screenSize.width / 15))
                                          .padding(.top, 30)
                                      
                                      Spacer()
                                      Spacer()
                                      Spacer()
                                  }
                            }
                        }
                    }
                }
                
                ZStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {showingSettings = false}, label: {
                            VStack {
                                Image(systemName: showingSettings ? "square.text.square" : "square.text.square.fill")
                                    .resizable()
                                    .frame(width: screenSize.width / 18, height: screenSize.width / 18)
                                    .foregroundColor(fontClr)
                                
                                Text("Widgets")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 30))
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {showingSettings = true}, label: {
                            VStack {
                                Image(systemName: showingSettings ? "gearshape.fill" : "gearshape")
                                    .resizable()
                                    .frame(width: screenSize.width / 18, height: screenSize.width / 18)
                                    .foregroundColor(fontClr)
                                
                                Text("Settings")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 30))
                            }
                        })
                        
                        Spacer()
                    }.padding(.bottom, screenSize.width / 20)
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
