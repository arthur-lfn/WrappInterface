//
//  GiftWidget.swift
//  GiftWidget
//
//  Created by Arturo Alfani on 27/02/23.
//

import WidgetKit
import SwiftUI

struct GiftWidget: Widget {
    let kind: String = "GiftWidget"
    var giftName: String = "Happy birthday!"
    var giftWrapColor: String = "AccentColor"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.arturoalfani.wrapp.GiftWidget",
            provider: Provider()) { entry in
                
                WidgetView(giftName: .constant(self.giftName),
                           giftDate: .constant(Date.now.addingTimeInterval(86400)),
                           giftWrapColor: .constant(self.giftWrapColor),
                           entry: entry)
            }
            .configurationDisplayName("Wrap")
            .description("This is an example of a Wrap Widget.")
            .supportedFamilies([.systemSmall])
    }
}
