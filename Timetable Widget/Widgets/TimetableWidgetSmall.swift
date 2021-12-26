//
//  TimetableWidgetSmall.swift
//  Timetable WidgetExtension
//
//  Created by Rostislav Brož on 12/26/21.
//

import WidgetKit
import SwiftUI

struct TimetableWidgetSmall: View {
    var entry: SimpleEntry
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                
                Divider()
            }
        } label: {
            Label("Timetable Widget", systemImage: "square.text.square")
        }
    }
}
