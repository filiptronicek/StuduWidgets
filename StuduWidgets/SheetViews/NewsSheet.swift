//
//  NewsSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 1/28/22.
//

import SwiftUI

struct NewsSheet: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        ZStack {
            model.objectsClrDark.ignoresSafeArea()
            
            VStack {
                Text("What's coming?")
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 12))
                    .padding(.trailing, model.screenSize.width / 5)
                    .padding([.top, .bottom], model.screenSize.width / 18)
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        Text("News")
                            .foregroundColor(model.objectsClrLight)
                            .font(.system(size: model.screenSize.width / 15))
                            .padding(.trailing, model.screenSize.width / 1.54)
                        
                        Button(action: {model.showingCustomizableWidgets.toggle()}, label: {
                            ZStack {
                                Image("Customization")
                                    .resizable()
                                    .frame(width: model.screenSize.width / 1.2, height: model.screenSize.width / 3)
                                    .cornerRadius(model.screenSize.width / 28)
                                
                                Text("Customizable \n\t\t\t\t\twidgets")
                                    .foregroundColor(model.fontClr)
                                    .font(.system(size: model.screenSize.width / 12))
                                    .padding([.trailing], model.screenSize.width / 7.5)
                            }
                        })
                        
                        if model.showingCustomizableWidgets == true {
                            Text("Widget color customizaiton is\nspeeding to get to the next patch!\nHere's a quick sneak peak")
                                .foregroundColor(model.fontClr)
                                .font(.system(size: model.screenSize.width / 18))
                                .padding([.top, .bottom], model.screenSize.width / 10)
                                .multilineTextAlignment(.center)
                            
                            Image("CustomTimetableWidget")
                                .resizable()
                                .frame(width: model.screenSize.width / 2.7, height: model.screenSize.width / 3)
                        }
                    }
                }
            }
        }
    }
}

struct NewsSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewsSheet()
            .environmentObject(ContentModel())
    }
}
