//
//  TimetableWidgetLarge.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 12/26/21.
//

import WidgetKit
import SwiftUI

struct TimetableWidgetLarge: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var entry: SimpleEntry
    
    var body: some View {
        Text("TimetableWidgetLarge")
    }
}
