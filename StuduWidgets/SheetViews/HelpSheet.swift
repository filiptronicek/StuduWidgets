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
                Title(text: "Help")
                
                ScrollView {
                    VStack {
                        Text("Hello, World!")
                    }
                }
            }
        }
    }
}

struct HelpSheet_Previews: PreviewProvider {
    static var previews: some View {
        HelpSheet()
            .environmentObject(ContentModel())
    }
}
