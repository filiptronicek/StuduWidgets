//
//  LunchWidgetEntryView.swift
//  WidgetsExtension
//
//  Created by Rostislav Brož on 1/8/22.
//

import SwiftUI

struct LunchWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            switch widgetFamily {
                case .systemSmall:
                    LunchWidgetSmall(entry: entry)
                        .environmentObject(ContentModel())
                
                case .systemMedium:
                    LunchWidgetMedium(entry: entry)
                        .environmentObject(ContentModel())
                
                default:
                    Text("Not implemented!")
            }
        }
    }
}

