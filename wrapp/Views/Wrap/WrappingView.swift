//
//  WrappingView.swift
//  wrapp
//
//  Created by Arturo Alfani on 20/02/23.
//

import SwiftUI

struct WrappingView: View {
    @StateObject var viewModel = WrappingViewModel()
    
    var body: some View {
        GeometryReader{ geo in
            VStack {
                WrappingBoardView()

                WrappingPlaygroundView()
            }
            .overlay {
                ToolboxFeaturesView().frame(height:  geo.size.height * 0.11)
            }
        }
        .environmentObject(viewModel)
    }
}

struct WrappingView_Previews: PreviewProvider {
    static var previews: some View {
        WrappingView().environmentObject(WrappingViewModel())
        GiftPickingView().environmentObject(WrappingViewModel())
    }
}
