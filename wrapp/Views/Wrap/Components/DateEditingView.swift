//
//  DateEditingView.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import SwiftUI

struct DateEditingView: View {
    @EnvironmentObject var viewModel: WrappingViewModel
    
    let sevenDaysFromNow = Date.now.addingTimeInterval(604800)
    var body: some View{
        VStack {
            ZStack(alignment: .leading) { 
                TextField("giftTitle", text: $viewModel.gift.name)
                    .hideOrShowToolbar()
                    .customTextField()
            }
            .padding(.bottom, 5)
            DatePicker(
                "open",
                selection: $viewModel.gift.openingGiftDate, in: Date.now.addingTimeInterval(300)...sevenDaysFromNow,
                displayedComponents: [.date,.hourAndMinute]
            )
            .customTextField()
        }
    }
}

struct DateEditingView_Previews: PreviewProvider {
    static var previews: some View {
        DateEditingView().environmentObject(WrappingViewModel())
    }
}
