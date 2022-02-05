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
                Title(text: "Feedback")
                
                ScrollView {
                    VStack {
                        Text("Hello, World!")
                    }
                }
            }
        }
    }
}

struct FeedbackSheet_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackSheet()
            .environmentObject(ContentModel())
    }
}
