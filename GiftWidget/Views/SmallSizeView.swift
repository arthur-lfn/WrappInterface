//
//  SmallSizeView.swift
//  GiftWidgetExtension
//
//  Created by Arturo Alfani on 27/02/23.
//

import SwiftUI
import WidgetKit

struct WidgetViewStructure: View {
    @Binding var giftName: String
    @Binding var giftDate: Date
    @Binding var giftWrapColor: String
    
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
            Color(.systemPink)
            
            VStack{
                Image("Bow")
                    .padding(.init(top: 40, leading: 0, bottom: 40, trailing: 0))
            }

            VStack(alignment: .leading) {
                Text(giftName)
                    .foregroundColor(.white)
                    .font(.system(size: 13))
                    .fontWeight(.heavy)

                Spacer()
               
                if (Date.now > giftDate.addingTimeInterval(-3600)){
                    Text("bow1")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .fontWeight(.black)
                    Text(giftDate, style: .timer)
                        .foregroundColor(Color(.white))
                        .font(.system(size: 20))
                        .fontWeight(.black)
                } else  if (Date.now > giftDate.addingTimeInterval(-86400)){
                    Text(timeLeft.hour ?? 0 == 1 ? "\(oneHour)" : "\(timeLeft.hour ?? 0) \(hours)")
                        .foregroundColor(Color(.white))
                        .font(.system(size: 20))
                        .fontWeight(.black)
                    
                    Text(giftDate.addingTimeInterval(TimeInterval(-3600*timeLeft.hour!))  , style: .relative)
                        .foregroundColor(Color(.white))
                        .font(.system(size: 12))
                        .fontWeight(.black)
                    
                } else {
                    Text(timeLeft.day ?? 0 == 1 ? "\(oneDay)" : "\(timeLeft.day ?? 0) \(days)")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.black)
                    Text(giftDate.addingTimeInterval(TimeInterval(-86400*timeLeft.day!)), style : .relative)
                        .foregroundColor(Color(.white))
                        .font(.system(size:  12))
                        .fontWeight(.black)
                }
            }.padding(20)
        }
    }
}
