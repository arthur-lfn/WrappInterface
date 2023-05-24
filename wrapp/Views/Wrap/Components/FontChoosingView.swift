//
//  FontChossingView.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import SwiftUI

struct FontChoosingView: View {
    @EnvironmentObject var viewModel: WrappingViewModel
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.allFonts) { font in
                        Button {
                            viewModel.gift.giftWidgetImage.fontName = font.fontCustomName
                        } label: {
                            PlaceholderView(fillColor: "PlaygroundComponents", ribbonName: "", fontCustomName: font.fontCustomName, fontDescription: font.description)
                        }
                        .buttonStyle(.plain)
                        .padding(5)
                        .overlay(alignment: .center) {
                            RoundedRectangle(cornerRadius: 26)
                                .stroke(Color("FeaturesText"), lineWidth: 2)
                                .opacity(viewModel.gift.giftWidgetImage.fontName == font.fontCustomName ? 1.0 : 0)
                        }
                        .padding(1)
                    }
                }
            }
            .listRowBackground(Color.clear)
        }
    }
}
