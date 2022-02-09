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
                ZStack {
                    Title(text: "Help center")
                    
                    VStack() {
                        Button(action: { model.showingHelpSheet.toggle()},
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

struct HelpSheet_Previews: PreviewProvider {
    static var previews: some View {
        HelpSheet()
            .environmentObject(ContentModel())
    }
}
