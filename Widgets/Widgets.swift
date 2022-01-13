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


struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
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


struct TimetableWidget: Widget {
    let kind: String = "TimetableWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            TimetableWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Timetable Widget")
        .description("This widget allows you to view your timetable conveniently on your Home Screen.")
    }
}


struct LunchWidget: Widget {
    let kind: String = "LunchWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            LunchWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Lunch Widget")
        .description("This little guy let's you view your lunches on your Home Screen.")
    }
}


@main
struct StuduWidgetsBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        TimetableWidget()
        LunchWidget()
    }
}
