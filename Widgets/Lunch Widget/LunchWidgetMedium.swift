//
//  LunchWidgetMedium.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 1/6/22.
//

import SwiftUI

struct LunchWidgetMedium: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    
    var entry: SimpleEntry
    
    var body: some View {
        Text("LunchWidgetMedium")
    }
}
