//
//  FeedbackSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 2/5/22.
//

import SwiftUI

struct FeedbackSheet: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ZStack {
            model.objectsClrDark.ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack {
                        Heading(text: "Let us know what we suck at")
                            .padding([.top], model.screenSize.width / 5)
                    }.padding(.bottom, model.screenSize.width / 5)
                }
            }
            
            VStack {
                Title(text: "Feedback")
                
                Spacer()
            }.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                SheetFooter()
            }.ignoresSafeArea()
        }
    }
}

struct FeedbackSheet_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackSheet()
            .environmentObject(ContentModel())
    }
}
