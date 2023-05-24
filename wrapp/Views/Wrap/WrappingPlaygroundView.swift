//
//  WrappingPlaygroundView.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import SwiftUI

struct WrappingPlaygroundView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: WrappingViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
                .ignoresSafeArea()
            VStack {
                if (viewModel.featureStep == 3) {
                    WidgetThemeEditingView()
                        .padding(.horizontal)
                } else if (viewModel.featureStep == 2) {
                    GiftPickingView()
                        .padding(.horizontal)
                } else if (viewModel.featureStep == 1) {
                    DateEditingView()
                        .padding(.horizontal)
                } else if (viewModel.featureStep == 4) {
                    FontChoosingView()
                        .padding(.horizontal)
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
