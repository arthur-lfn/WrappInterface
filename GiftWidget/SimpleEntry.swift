//
//  SimpleEntry.swift
//  GiftWidgetExtension
//
//  Created by Arturo Alfani on 27/02/23.
//

import WidgetKit

struct SimpleEntry: TimelineEntry {
    var date: Date
    
    let screen = GiftWrapPreviewView(giftName: .constant("To my bae"),
                                     giftDate: .constant(Date.now.addingTimeInterval(86400)),
                                     giftWrapColor: .constant("AccentColor"),
                                     ribbonName: .constant("Bow1"),
                                     fontName: .constant("SFPro-Regular"))
}
