//
//  GiftWrapPreviewView.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import SwiftUI

struct GiftWrapPreviewView: View {
    @Binding var giftName: String
    @Binding var giftDate: Date
    @Binding var giftWrapColor: String
    @Binding var ribbonName: String
    @Binding var fontName: String
    
    internal var oneDay = String(localized: "oneDay")
    internal var days = String(localized: "days")
    internal var oneHour = String(localized: "oneHour")
    internal var hours = String(localized: "hours")
    internal var minutes = String(localized: "minutes")
    
    var timeLeft: DateComponents {
        Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: Date.now, to: giftDate)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(giftWrapColor))
                .frame(width: 150, height: 150)
                .cornerRadius(26)
            Image(ribbonName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 150, maxHeight: 150)
            VStack(alignment: .leading) {
                Text(giftName)
                    .foregroundColor(.white)
                    .font(fontName.count > 1 ? .custom(fontName, size: 13) : .system(size: 13))
                    .fontWeight(.heavy)
                
                Spacer()
                
                if (Date.now > giftDate.addingTimeInterval(-3600)){
                    Text("today")
                        .foregroundColor(.white)
                        .font(fontName.count > 1 ? .custom(fontName, size: 30) : .system(size: 30))
                        .fontWeight(.black)
                    Text(giftDate, style: .timer)
                        .foregroundColor(Color("WidgetSubtext"))
                        .font(fontName.count > 1 ? .custom(fontName, size: 20) : .system(size: 20))
                        .fontWeight(.black)
                } else  if (Date.now > giftDate.addingTimeInterval(-86400)){
                    Text(timeLeft.hour ?? 0 == 1 ? "\(oneHour)" : "\(timeLeft.hour ?? 0) \(hours)")
                        .foregroundColor(.white)
                        .font(fontName.count > 1 ? .custom(fontName, size: 20) : .system(size: 20))
                        .fontWeight(.black)
                    
                    Text(giftDate.addingTimeInterval(TimeInterval(-3600*timeLeft.hour!))  , style: .relative)
                        .foregroundColor(Color("WidgetSubtext"))
                        .font(fontName.count > 1 ? .custom(fontName, size: 12) : .system(size: 12))
                        .fontWeight(.black)
                } else {
                    Text(timeLeft.day ?? 0 == 1 ? "\(oneDay)" : "\(timeLeft.day ?? 0) \(days)")
                        .foregroundColor(.white)
                        .font(fontName.count > 1 ? .custom(fontName, size: 20) : .system(size: 20))
                        .fontWeight(.black)
                    Text(giftDate.addingTimeInterval(TimeInterval(-86400*timeLeft.day!)), style : .relative)
                        .foregroundColor(Color("WidgetSubtext"))
                        .font(fontName.count > 1 ? .custom(fontName, size: 12) : .system(size: 12))
                        .fontWeight(.black)
                }
            }
            .padding(20)
            .frame(width: 150, height: 150, alignment: .leading)
        }
    }
}

struct GiftWrapPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        GiftWrapPreviewView(giftName: .constant("To my bae"), giftDate: .constant(Date.now.addingTimeInterval(86400)), giftWrapColor: .constant("AccentColor"), ribbonName: .constant("Bow1"), fontName: .constant("SFPro-Regular"))
    }
}
