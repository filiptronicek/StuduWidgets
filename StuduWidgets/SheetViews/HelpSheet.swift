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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HelpSheet_Previews: PreviewProvider {
    static var previews: some View {
        HelpSheet()
            .environmentObject(ContentModel())
    }
}
