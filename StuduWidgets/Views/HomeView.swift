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
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    
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
                            if isSignedIn == false {
                                Text("Get started")
                                    .foregroundColor(objectsClrLight)
                                    .font(.system(size: screenSize.width / 15))
                                    .padding(.trailing, screenSize.width / 3)
                                    .padding(.bottom, screenSize.width / 60)
                                
                                Text("For a widget to work, you need to **sign in** \nto a corresponding service...")
                                    .foregroundColor(fontClr)
                                    .font(.system(size: screenSize.width / 25))
                                    .frame(width: screenSize.width / 1.2, height: screenSize.width / 10)
                                    .padding(.bottom, screenSize.width / 25)
                                    .padding(.trailing, screenSize.width / 20)
                                
                                HStack {
                                    Image(systemName: "gearshape")
                                        .resizable()
                                        .frame(width: screenSize.width / 18, height: screenSize.width / 18)
                                        .foregroundColor(fontClr)
                                                                        
                                    Text("Open **Settings**")
                                        .foregroundColor(fontClr)
                                        .font(.system(size: screenSize.width / 25))
                                        .padding(.leading, screenSize.width / 30)
                                }.padding(.top, screenSize.width / 40)
                                
                                HStack {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: screenSize.width / 18, height: screenSize.width / 18)
                                        .foregroundColor(fontClr)
                                    
                                    Text("Click on **Add account**")
                                        .foregroundColor(fontClr)
                                        .font(.system(size: screenSize.width / 25))
                                        .padding(.leading, screenSize.width / 30)
                                }.padding(.top, screenSize.width / 50)
                                
                                HStack {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: screenSize.width / 18, height: screenSize.width / 18)
                                        .foregroundColor(fontClr)
                                    
                                    Text("**Sign in** to a service")
                                        .foregroundColor(fontClr)
                                        .font(.system(size: screenSize.width / 25))
                                        .padding(.leading, screenSize.width / 30)
                                }.padding(.top, screenSize.width / 50)
                                    .padding(.bottom, screenSize.width / 18)
                            }
                            
                            Text("Widgets")
                                .foregroundColor(objectsClrLight)
                                .font(.system(size: screenSize.width / 15))
                                .padding(.trailing, screenSize.width / 2.42)
                            
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
                                Text("Accounts")
                                    .foregroundColor(objectsClrLight)
                                    .font(.system(size: screenSize.width / 15))
                                    .padding(.trailing, screenSize.width / 2.63)
                                    // this padding is 0.3 pixels off and it's pissing me off
                                
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
                                    }.contextMenu {
                                        Button(role: .destructive,
                                               action: {
                                                    isSignedIn = false
                                                },
                                               
                                               label: {
                                                    Label("Sign out", systemImage: "trash")
                                        })
                                    }
                                }
                                
                                else {
                                    Menu {
                                        Button (action: {
                                                    // Todo(ft): add sign in action
                                            
                                                    isSignedIn = true
                                                },
                                                
                                                label: {
                                                    Label("Sign in to Bakaláři.cz", systemImage: "graduationcap")
                                        })
                                        
                                        Button (action: {
                                                    // Todo(ft): add sign in action
                                                    isSignedIn = true
                                                },
                                                label: {
                                                    Label("Sign in to Strava.cz", systemImage: "fork.knife")
                                        })
                                        
                                    } label: {
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
                                
                                Text("Customization")
                                    .foregroundColor(objectsClrLight)
                                    .font(.system(size: screenSize.width / 15))
                                    .padding(.top, 30)
                                    .padding(.trailing, screenSize.width / 4.2)
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
