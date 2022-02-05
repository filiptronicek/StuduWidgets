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
                        Heading(text: "Customization")
                            .padding([.top], model.screenSize.width / 5)
                        
                        Button(action: {},
                               label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(model.objectsClrMedium)
                                            .frame(width: model.screenSize.width / 1.1, height: model.screenSize.width / 8)
                                            .cornerRadius(model.screenSize.width / 28)
                                        
                                        HStack {
                                            Text("Layout")
                                                .foregroundColor(model.fontClr)
                                                .font(.system(size: model.screenSize.width / 20))
                                                .padding(.trailing, model.screenSize.width / 1.655)
                                        }
                                }
                        })
                    }.padding(.bottom, model.screenSize.width / 5)
                }
            }
            
            VStack {
                Title(text: "Lunch Widget")
                
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
