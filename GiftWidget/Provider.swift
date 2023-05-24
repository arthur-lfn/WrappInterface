//
//  Provider.swift
//  GiftWidgetExtension
//
//  Created by Arturo Alfani on 27/02/23.
//
import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    typealias Entry = SimpleEntry

        // Provides a timeline entry representing a placeholder version of the widget.
    func placeholder(in context: Context) -> SimpleEntry {
        return SimpleEntry(date: Date())
      }

        // Provides a timeline entry that represents the current time and state of a widget.
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        completion(SimpleEntry(date: Date()))
    }

        // Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
       
        let entry = SimpleEntry(date: Date())
            let timeline = Timeline(entries: [entry],
                                    policy: .after(Date.distantFuture) )
            completion(timeline)
    }
}
