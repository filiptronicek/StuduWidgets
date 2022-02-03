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
                Title(text: "Lunch Widget")
                
                ScrollView {
                    VStack {
                        Heading(text: "Customization")
                        
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
                    }
                }
                
                Text("Swipe down")
                    .foregroundColor(model.fontClr)
                    .font(.system(size: model.screenSize.width / 18))
            }
        }
    }
}

struct LunchSheet_Previews: PreviewProvider {
    static var previews: some View {
        LunchSheet()
            .environmentObject(ContentModel())
    }
}
