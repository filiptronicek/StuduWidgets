//
//  LunchSheet.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 12/20/21.
//

import SwiftUI

struct LunchSheet: View {
    var body: some View {
        ZStack {
            objectsClrDark.ignoresSafeArea()
            
            Text("* Demo on how to use widget, what's on it, \nhow it works and link to the source code *")
                .foregroundColor(fontClr)
        }
    }
}

struct LunchSheet_Previews: PreviewProvider {
    static var previews: some View {
        LunchSheet()
    }
}
