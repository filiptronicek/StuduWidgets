//
//  TimetableWidgetEntryView.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 1/8/22.
//

import SwiftUI

struct TimetableWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            switch widgetFamily {
                case .systemSmall:
                
                    TimetableWidgetSmall(entry: entry)
                        .environmentObject(ContentModel())
                
                case .systemMedium:
                
                    TimetableWidgetMedium(entry: entry)
                        .environmentObject(ContentModel())
                
                default:
                    Text("Not implemented!")
            }
        }
    }
}
