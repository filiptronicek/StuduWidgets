//
//  WidgetPreviews.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 2/10/22.
//

import SwiftUI

struct TimetableWidgetSmallPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: [String]
    
    var body: some View {
        Text("Hello, World!")
    }
}


struct TimetableWidgetMediumPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: [String]
    
    var body: some View {
        Text("Hello, World!")
    }
}


struct LunchWidgetSmallPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: String
    
    var body: some View {
        Text("Hello, World!")
    }
}


struct LunchWidgetMediumPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: String
    
    var body: some View {
        Text("Hello, World!")
    }
}
