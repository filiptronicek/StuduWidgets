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




struct HomeView: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    
    // declare state variables for sheets
    
    @State private var showingSettings:Bool = true
    
    @State private var showingTimetableSheet:Bool = false
    @State private var showingLunchSheet:Bool = false
    @State private var showingDataSheet:Bool = false
    
    @State private var showingLoginStrava:Bool = false
    @State private var showingLoginBakalari:Bool = false
    
    @State private var isSignedInToBakalari:Bool = false
    @State private var isSignedInToStrava:Bool = false
    
    
    var body: some View {
        ZStack {
            model.bg.ignoresSafeArea()
            
            VStack {
                Text("StuduWidgets")
                    .foregroundColor(model.fontClr)
                    .font(.system(size: screenSize.width / 10))
                    .padding(.trailing, screenSize.width / 5)
                    .padding([.top, .bottom], screenSize.width / 18)
                
                if !showingSettings {
                    ScrollView {
                        VStack {
                            if !isSignedInToBakalari && !isSignedInToStrava {
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
                            
                            Button(action: {showingTimetableSheet.toggle()}, label: {
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
                            }).sheet(isPresented: $showingTimetableSheet) {TimetableSheet()}
                            
                            Button(action: {showingLunchSheet.toggle()},
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
                            }).sheet(isPresented: $showingLunchSheet) {LunchSheet()}
                        }
                    }
                }
                
                else {
                    VStack {
                        ScrollView {
                            VStack {
                                Text("Accounts")
                                    .foregroundColor(model.objectsClrLight)
                                    .font(.system(size: screenSize.width / 15))
                                    .padding(.trailing, screenSize.width / 1.8)
                                    // this padding is 0.3 pixels off and it's pissing me off
                                
                                VStack {
                                    if isSignedInToBakalari {
                                        ZStack {
                                            Rectangle()
                                                .fill(model.objectsClrDark)
                                                .frame(width: screenSize.width / 1.1, height: screenSize.width / 4)
                                                .cornerRadius(15)
                                            
                                            HStack {
                                                Spacer()
                                                
                                                Image("frightened")
                                                    .resizable()
                                                    .frame(width: screenSize.width / 5.5, height: screenSize.width / 5.5)
                                                    .clipShape(Circle())
                                                    .overlay(Circle().stroke(model.fontClr, lineWidth: screenSize.width / 150))
                                                    .padding(.trailing, screenSize.width / 50)
                                                
                                                VStack {
                                                    Text("Rostislav Brož")
                                                        .foregroundColor(model.fontClr)
                                                        .font(.system(size: screenSize.width / 18))
                                                    
                                                    Text("Bakalari")
                                                        .foregroundColor(model.objectsClrLight)
                                                        .font(.system(size: screenSize.width / 25))
                                                }
                                                
                                                Spacer()
                                            }
                                        }.contextMenu {
                                            Button(role: .destructive,
                                                   action: {
                                                        isSignedInToBakalari = false
                                                    },
                                                   
                                                   label: {
                                                        Label("Sign out", systemImage: "trash")
                                            })
                                        }
                                    }
                                        
                                        if isSignedInToStrava {
                                            ZStack {
                                                Rectangle()
                                                    .fill(model.objectsClrDark)
                                                    .frame(width: screenSize.width / 1.1, height: screenSize.width / 4)
                                                    .cornerRadius(15)
                                                
                                                HStack {
                                                    Spacer()
                                                    
                                                    Image("frightened")
                                                        .resizable()
                                                        .frame(width: screenSize.width / 5.5, height: screenSize.width / 5.5)
                                                        .clipShape(Circle())
                                                        .overlay(Circle().stroke(model.fontClr, lineWidth: screenSize.width / 150))
                                                        .padding(.trailing, screenSize.width / 50)
                                                    
                                                    VStack {
                                                        Text("Rostislav Brož")
                                                            .foregroundColor(model.fontClr)
                                                            .font(.system(size: screenSize.width / 18))
                                                        
                                                        Text("Strava")
                                                            .foregroundColor(model.objectsClrLight)
                                                            .font(.system(size: screenSize.width / 25))
                                                    }
                                                    
                                                    Spacer()
                                                }
                                            }.contextMenu {
                                                Button(role: .destructive,
                                                       action: {
                                                            isSignedInToStrava = false
                                                        },
                                                       
                                                       label: {
                                                            Label("Sign out", systemImage: "trash")
                                                })
                                            }
                                        }
                                        
                                        Menu {
                                            if !isSignedInToBakalari {
                                                Button (action: {
                                                            // Todo(ft): add sign in action
                                                            isSignedInToBakalari = true
                                                        },
                                                        
                                                        label: {
                                                            Label("Sign in to Bakaláři.cz", systemImage: "graduationcap")
                                                })
                                            }
                                            
                                            if !isSignedInToStrava {
                                                Button (action: {
                                                            // Todo(ft): add sign in action
                                                            isSignedInToStrava = true
                                                        },
                                                        label: {
                                                            Label("Sign in to Strava.cz", systemImage: "fork.knife")
                                                })
                                            }
                                        } label: {
                                                ZStack {
                                                    if !(isSignedInToStrava && isSignedInToBakalari) {

                                                    Rectangle()
                                                            .fill(model.objectsClrDark)
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
                                    }

                                Text("Color theme")
                                    .foregroundColor(model.objectsClrLight)
                                    .font(.system(size: screenSize.width / 15))
                                    .padding(.top, screenSize.width / 15)
                                    .padding(.trailing, screenSize.width / 1.986)
                                
                                Button(action: {model.changeColorTheme()}, label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(model.objectsClrDark)
                                            .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                            .cornerRadius(15)
                                        HStack {
                                            Text("Dark (default)")
                                                .foregroundColor(model.fontClr)
                                                .font(.system(size: screenSize.width / 18))
                                                .frame(width: screenSize.width / 1.5, height: screenSize.width / 8, alignment: .leading)
                                                
                                            
                                            Image(systemName: model.isDarkmode ? "checkmark" : "")
                                                .resizable()
                                                .frame(width: screenSize.width / 20, height: screenSize.width / 20)
                                                .foregroundColor(model.objectsClrLight)
                                                
                                        }
                                    }
                                })
                                
                                Button(action: {model.changeColorTheme()}, label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(model.objectsClrDark)
                                            .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                            .cornerRadius(15)
                                        HStack {
                                            Text("Light (lame)")
                                                .foregroundColor(model.fontClr)
                                                .font(.system(size: screenSize.width / 18))
                                                .frame(width: screenSize.width / 1.5, height: screenSize.width / 8, alignment: .leading)
                                                
                                            
                                            Image(systemName: model.isDarkmode ? "" : "checkmark")
                                                .resizable()
                                                .frame(width: screenSize.width / 20, height: screenSize.width / 20)
                                                .foregroundColor(model.objectsClrLight)
                                                
                                        }
                                    }
                                })
                                
                                Text("Information")
                                    .foregroundColor(model.objectsClrLight)
                                    .font(.system(size: screenSize.width / 15))
                                    .padding(.top, screenSize.width / 15)
                                    .padding(.trailing, screenSize.width / 1.986)
                                
                                Button(action: {showingDataSheet.toggle()}, label: {
                                        ZStack {
                                            Rectangle()
                                                .fill(model.objectsClrDark)
                                                .frame(width: screenSize.width / 1.1, height: screenSize.width / 8)
                                                .cornerRadius(15)
                                            
                                            HStack {
                                                Text("Data handling")
                                                    .foregroundColor(model.fontClr)
                                                    .font(.system(size: screenSize.width / 16))
                                                Image(systemName: "chevron.right")
                                                    .resizable()
                                                    .frame(width: screenSize.width / 30, height: screenSize.width / 20)
                                                    .padding(.leading, screenSize.width / 3.68)
                                                    .foregroundColor(Color.gray)
                                            }
                                        }
                                }).sheet(isPresented: $showingDataSheet) {DataSheet()}
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
                                    .foregroundColor(model.fontClr)
                                
                                Text("Widgets")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: screenSize.width / 30))
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {showingSettings = true}, label: {
                            VStack {
                                Image(systemName: showingSettings ? "gearshape.fill" : "gearshape")
                                    .resizable()
                                    .frame(width: screenSize.width / 18, height: screenSize.width / 18)
                                    .foregroundColor(model.fontClr)
                                
                                Text("Settings")
                                    .foregroundColor(model.fontClr)
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
            .environmentObject(ContentModel())
    }
}
