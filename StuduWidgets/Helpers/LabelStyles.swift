//
//  LabelStyles.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 1/29/22.
//

import SwiftUI


// MARK: Heading

struct Heading: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(model.objectsClrLight)
            .font(.system(size: model.screenSize.width / 15))
            .frame(width: model.screenSize.width / 1.2, alignment: .leading)
    }
}


// MARK: Title

struct Title: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(model.fontClr)
            .font(.system(size: model.screenSize.width / 12))
            .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 5, alignment: .leading)
            .padding([.leading], model.screenSize.width / 30)
            .padding([.bottom], model.screenSize.width / 18)
            .background(
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(stops: [.init(color: model.objectsClrDark, location: 0), .init(color: model.objectsClrDark.opacity(0.01), location: 1)]), startPoint: .top, endPoint: .bottom))
            )
    }
}


// MARK: Sheet footer

struct SheetFooter: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            Text("Swipe down to dismiss")
                .foregroundColor(model.fontClr)
                .font(.system(size: model.screenSize.width / 22))
                .frame(width: model.screenSize.width, height: model.screenSize.width / 5)
                .background(
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(stops: [.init(color: model.objectsClrDark.opacity(0.001), location: 0), .init(color: model.objectsClrDark, location: 1)]), startPoint: .top, endPoint: .bottom))
                )
        }
    }
}


// MARK: Item list

struct ItemList: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var text: String
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: model.screenSize.width / 20, height: model.screenSize.width / 20)
                .foregroundColor(model.fontClr)
                                                
            Text(text)
                .foregroundColor(model.fontClr)
                .font(.system(size: model.screenSize.width / 25))
                .padding(.leading, model.screenSize.width / 30)
        }
    }
}


// MARK: Button label

struct ButtonLabel: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var text: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(model.objectsClrDark)
                .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                .cornerRadius(model.screenSize.width / 28)
        
            Text(text)
                .foregroundColor(model.fontClr)
                .font(.system(size: model.screenSize.width / 17))
                .frame(width: model.screenSize.width / 1.4, height: model.screenSize.width / 8, alignment: .leading)
            
            Image(systemName: "chevron.right")
                .resizable()
                .foregroundColor(model.objectsClrLight)
                .frame(width: model.screenSize.width / 30, height: model.screenSize.width / 20)
                .padding(.leading, model.screenSize.width / 1.5)
        }
    }
}


// MARK: Widget card label

struct WidgetCardLabel: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var heading: String
    var bodyText: String
    var imageLink: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(model.objectsClrDark)
                .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 3.2)
                .cornerRadius(model.screenSize.width / 28)
            
            Group {
                Image(imageLink)
                    .resizable()
                    .frame(width: model.screenSize.width / 6, height: model.screenSize.width / 6)
            }.frame(width: model.screenSize.width / 1.25, alignment: .leading)
            
            VStack {
                Text(heading)
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 18))
                    .frame(width: model.screenSize.width / 1.9, alignment: .leading)
                
                Text(bodyText)
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 25))
                    .frame(width: model.screenSize.width / 1.9, alignment: .leading)
            }.padding([.leading], model.screenSize.width / 6.3)
            
            Group {
                Image(systemName: "chevron.right")
                    .resizable()
                    .foregroundColor(model.objectsClrLight)
                    .frame(width: model.screenSize.width / 30, height: model.screenSize.width / 20)
                    .padding(.leading, model.screenSize.width / 25)
            }.frame(width: model.screenSize.width / 1.3, alignment: .trailing)
        }
    }
}

enum LoginService: String {
    case strava = "Strava.cz"
    case bakalari = "Bakaláři.cz"
}


// MARK: User profile card

struct UserProfileCard: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    @ObservedObject var userSettings = ContentModel.UserSettings()
    
    var service: LoginService
    var description: String
    
    var profilePicture: [String] = ["maleicon", "femaleicon"]
    var index: Int = Int.random(in: 0...1)
    @State var hueDegrees: Double = Double.random(in: 30...330)
    
    var body: some View {
        switch service {
            case .bakalari:
                ZStack {
                    Rectangle()
                        .fill(model.objectsClrDark)
                        .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 4)
                        .cornerRadius(model.screenSize.width / 28)
                    
                    Button(action: {
                                hueDegrees = Double.random(in: 0...360)
                            },
                           label: {
                                Image(profilePicture[index])
                                    .resizable()
                                    .hueRotation(.degrees(hueDegrees))
                                    .frame(width: model.screenSize.width / 5.5, height: model.screenSize.width / 5.5)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(model.fontClr, lineWidth: model.screenSize.width / 150))
                                    .padding(.trailing, model.screenSize.width / 50)
                    }).frame(width: model.screenSize.width / 1.6, alignment: .leading)
                   
                    HStack {
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text(userSettings.bakalariUsername)
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 18))
                            
                            Text(description)
                                .foregroundColor(model.objectsClrLight)
                                .font(.system(size: model.screenSize.width / 25))
                        }.frame(width: model.screenSize.width / 1.8, alignment: .leading)
                    }
                }.contextMenu {
                    Button(role: .destructive,
                           action: {
                                userSettings.bakalariRefreshToken = ""
                                userSettings.bakalariAccessToken = ""
                            },
                           
                           label: {
                                Label("Sign out", systemImage: "trash")
                    })
                }
            
            case .strava:
                ZStack {
                    Rectangle()
                        .fill(model.objectsClrDark)
                        .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 4)
                        .cornerRadius(model.screenSize.width / 28)
                    
                    Button(action: {
                                hueDegrees = Double.random(in: 0...360)
                            },
                           label: {
                                Image(profilePicture[index])
                                    .resizable()
                                    .hueRotation(.degrees(hueDegrees))
                                    .frame(width: model.screenSize.width / 5.5, height: model.screenSize.width / 5.5)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(model.fontClr, lineWidth: model.screenSize.width / 150))
                                    .padding(.trailing, model.screenSize.width / 50)
                    }).frame(width: model.screenSize.width / 1.6, alignment: .leading)
                   
                    HStack {
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text(userSettings.stravaDisplayName)
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 18))
                            
                            Text(description)
                                .foregroundColor(model.objectsClrLight)
                                .font(.system(size: model.screenSize.width / 25))
                        }.frame(width: model.screenSize.width / 1.8, alignment: .leading)
                    }
                }.contextMenu {
                    Button(role: .destructive,
                           action: {
                                userSettings.stravaToken = ""
                                userSettings.stravaDisplayName = ""
                            },
                           
                           label: {
                                Label("Sign out", systemImage: "trash")
                    })
            }
        }
    }
}

struct UserProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileCard(service: .bakalari, description: "Strava.cz")
            .environmentObject(ContentModel())
    }
}
