//
//  LunchWidgetLarge.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 1/9/22.
//

import SwiftUI

struct LunchWidgetLarge: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    
    var entry: SimpleEntry
    
    var body: some View {
        Text("LunchWidgetLarge")
    }
}
