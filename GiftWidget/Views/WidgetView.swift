//
//  WidgetView.swift
//  GiftWidgetExtension
//
//  Created by Arturo Alfani on 27/02/23.
//

import SwiftUI
import WidgetKit

struct WidgetView: View {
    @Binding var giftName: String
    @Binding var giftDate: Date
    @Binding var giftWrapColor: String

    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            WidgetViewStructure(giftName: .constant(giftName),
                                giftDate: .constant(giftDate),
                                giftWrapColor: .constant(giftWrapColor))
        default:
            WidgetViewStructure(giftName: .constant(giftName),
                                giftDate: .constant(giftDate),
                                giftWrapColor: .constant(giftWrapColor))
        }
    }
}
