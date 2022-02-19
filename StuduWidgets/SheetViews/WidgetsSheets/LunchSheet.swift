//
//  LunchSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/20/21.
//

import SwiftUI

struct LunchSheet: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            model.objectsClrDark.ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack {
                        Button(action: {},
                               label: {
                                    LunchWidgetPreview(data: "Kuřecí řízek, bramborová kaše", size: "Small")
                        }).padding(.top, model.screenSize.width / 3)
                        
                        Heading(text: "Get started")
                            .padding([.top], model.screenSize.width / 5)
                    }.padding(.bottom, model.screenSize.width / 5)
                }
            }
            
            VStack {
                ZStack {
                    Title(text: "Lunch Widget")
                    
                    VStack() {
                        Button(action: { model.showingLunchSheet.toggle()},
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

struct LunchSheet_Previews: PreviewProvider {
    static var previews: some View {
        LunchSheet()
            .environmentObject(ContentModel())
    }
}
