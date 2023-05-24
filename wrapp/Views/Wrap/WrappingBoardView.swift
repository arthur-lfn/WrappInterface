//
//  WrappingBoardView.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import SwiftUI

struct WrappingBoardView: View {
    @EnvironmentObject var viewModel: WrappingViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack(alignment:.center) {
                if (viewModel.hideToolbar == false) {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Text("Back")
                                .foregroundColor(Color("FeaturesText"))
                                .fontWeight(.heavy)
                                .font(.system(size: 22))
                        }
                        
                        Spacer()
                        
                        Button {
                            //
                        } label: {
                            ShareLink(
                                item: viewModel.gift.giftWidgetImage.snapshotWidgetImage,
                                subject: Text("shareLinkSubject"),
                                message: Text("shareLinkMessage"),
                                preview: SharePreview(
                                    viewModel.gift.giftWidgetImage.snapshotWidgetImage.caption,
                                    image: viewModel.gift.giftWidgetImage.snapshotWidgetImage.image
                                )
                            ) {
                                Text("Gift")
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                                    .font(.system(size: 22))
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(3)
                        .overlay(alignment: .center) {
                            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                .stroke(Color("FeaturesText"), lineWidth: 2)
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                GiftWrapPreviewView(
                    giftName: $viewModel.gift.name,
                    giftDate: $viewModel.gift.openingGiftDate,
                    giftWrapColor: $viewModel.gift.giftWidgetImage.colorWidget,
                    ribbonName: $viewModel.gift.giftWidgetImage.ribbonName,
                    fontName: $viewModel.gift.giftWidgetImage.fontName
                )
                .shadow(color: Color(viewModel.gift.giftWidgetImage.colorWidget), radius: 20, y: 20)
                
                Spacer()
                Spacer()
            }
        }
    }
}
