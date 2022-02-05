//
//  HelpSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 2/1/22.
//

import SwiftUI

struct HelpSheet: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            model.objectsClrDark.ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack {
                        Heading(text: "Start over")
                            .padding([.top], model.screenSize.width / 5)
                    }.padding(.bottom, model.screenSize.width / 5)
                }
            }
            
            VStack {
                Title(text: "Help center")
                
                Spacer()
            }.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                SheetFooter()
            }.ignoresSafeArea()
        }
    }
}

struct HelpSheet_Previews: PreviewProvider {
    static var previews: some View {
        HelpSheet()
            .environmentObject(ContentModel())
    }
}
