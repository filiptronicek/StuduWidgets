//
//  WidgetPreviews.swift
//  StuduWidgets
//
//  Created by Rostislav Brož on 2/10/22.
//

import SwiftUI


// MARK: TimetableWidget small

struct TimetableWidgetSmallPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: [String]
    
    var body: some View {
        Text("Hello, World!")
    }
}


// MARK: TimetableWidget medium

struct TimetableWidgetMediumPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: [String]
    
    var body: some View {
        Text("Hello, World!")
    }
}


// MARK: LunchWidget small

struct LunchWidgetSmallPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: String
    
    var body: some View {
        Text("Hello, World!")
    }
}


// MARK: LunchWidget medium

struct LunchWidgetMediumPreview: View {
    // Access data in ContentModel.swift
    
    @EnvironmentObject var model: ContentModel
    
    var mockData: String
    
    var body: some View {
        Text("Hello, World!")
    }
}
