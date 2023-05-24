//
//  WidgetThemeEditingView.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import SwiftUI

struct WidgetThemeEditingView: View {
    @EnvironmentObject var viewModel: WrappingViewModel
    
    var body: some View {
        VStack {            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.allRibbons) { ribbon in
                        Button {
                            viewModel.gift.giftWidgetImage.ribbonName = ribbon.ribbonName
                        } label: {
                            PlaceholderView(fillColor: "PlaygroundComponents", ribbonName: ribbon.ribbonName, fontCustomName: "", fontDescription: "")
                        }
                        .padding(5)
                        .overlay(alignment: .center) {
                            RoundedRectangle(cornerRadius: 26)
                                .stroke(Color("FeaturesText"), lineWidth: 2)
                                .opacity(viewModel.gift.giftWidgetImage.ribbonName == ribbon.ribbonName ? 1.0 : 0)
                        }
                        .padding(1)
                    }
                }
            }
            .listRowBackground(Color.clear)
            
            Grid(horizontalSpacing: 15) {
                GridRow {
                    ForEach(viewModel.allWidgetTheme) { colorTheme in
                        Button {
                            viewModel.gift.giftWidgetImage.colorWidget = colorTheme.colorThemeName
                        } label: {
                            Circle()
                                .foregroundColor(Color(colorTheme.colorThemeName))
                                .frame(width: 40)
                        }
                        .padding(3)
                        .overlay(alignment: .center) {
                            Circle()
                                .stroke(Color("FeaturesText"), lineWidth: 2)
                                .opacity(viewModel.gift.giftWidgetImage.colorWidget == colorTheme.colorThemeName ? 1.0 : 0)
                        }
                    }
                }
            }
            .padding(.top, 50)
        }
    }
}
