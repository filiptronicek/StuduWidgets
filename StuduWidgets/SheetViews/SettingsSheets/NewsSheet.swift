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
                ScrollView(showsIndicators: false) {
                    VStack {
                        Heading(text: "News")
                            .padding([.top], model.screenSize.width / 5)
                        
                        Button(action: {model.showingCustomizableWidgets.toggle()}, label: {
                            ZStack {
                                Image("Customization")
                                    .resizable()
                                    .frame(width: model.screenSize.width / 1.2, height: model.screenSize.width / 3)
                                    .cornerRadius(model.screenSize.width / 28)
                                
                                Text("Customizable \n\t\t\t\t\twidgets")
                                    .foregroundColor(.white)
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
                    }.padding(.bottom, model.screenSize.width / 5)
                }
            }
            
            VStack {
                ZStack {
                    Title(text: "What's coming?")
                    
                    VStack() {
                        Button(action: { model.showingNewsSheet.toggle()},
                               label: {
                                    Text("Cancel")
                                        .padding([.bottom], model.screenSize.width / 25)
                        })
                    }.frame(width: model.screenSize.width / 1.15, alignment: .trailing)
                }
                
                Spacer()
            }.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                SheetFooter()
            }.ignoresSafeArea()
        }
    }
}

struct NewsSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewsSheet()
            .environmentObject(ContentModel())
    }
}
