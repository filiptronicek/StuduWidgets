//
//  Widgets.swift
//  Widgets
//
//  Created by Rostislav Brož on 12/26/21.
//

import WidgetKit
import SwiftUI
import Intents


// declaration of a constant from which screen width and height is accessed to properly position and size objects

let screenSize: CGRect = UIScreen.main.bounds


// declare vars for UI colors

public var bg = Color(red: 0.05, green: 0, blue: 0)
public var objectsClrDark = Color(red: 0.1333, green: 0.1333, blue: 0.1373)
public var objectsClrMedium = Color(red: 0.2266, green: 0.2266, blue: 0.2266)
public var objectsClrLight = Color(red: 0.6566, green: 0.6566, blue: 0.6566)
public var objectClrBlue = Color(red: 0, green: 1, blue: 0.9375)
public var fontClr = Color(red: 1, green: 1, blue: 1)
public var fontClrDark = Color(red: 0.3320, green: 0.3242, blue: 0.3242)


struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct WidgetsEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            switch widgetFamily {
                case .systemSmall:
                
                    TimetableWidgetSmall(entry: entry)
                
                case .systemMedium:
                
                    TimetableWidgetMedium(entry: entry)
                
                case .systemLarge:
                
                    TimetableWidgetLarge(entry: entry)
                
                default:
                    Text("Not implemented!")
            }
        }
    }
}

@main
struct Widgets: Widget {
    let kind: String = "Widgets"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Widgets_Previews: PreviewProvider {
    static var previews: some View {
        WidgetsEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
