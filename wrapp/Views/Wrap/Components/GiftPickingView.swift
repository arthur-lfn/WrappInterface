//
//  GiftPickingView.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import SwiftUI
import PhotosUI

struct GiftPickingView: View {
    @EnvironmentObject var viewModel: WrappingViewModel
    
    @State var isGiftVisible: Bool = false
    @State var prompt = String(localized: "kindWords")
    
    var body: some View{
        VStack(alignment: .leading){
            ZStack(alignment: .leading) {
                TextField(prompt, text: $viewModel.gift.personalNote)
                    .hideOrShowToolbar()
                    .customTextField()
            }
            .padding(.bottom, 10)
            PhotosPicker(selection: $viewModel.giftImageSelection,
                         matching: .images,
                         photoLibrary: .shared()) {
                ExtractedView(imageState: viewModel.giftImageStatetoHide)
            }
        }
    }
}

struct ExtractedView: View {
    @EnvironmentObject var viewModel: WrappingViewModel
    
    let imageState:  WrappingViewModel.GiftImageState
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8,style: .continuous)
                .frame(width: viewModel.hideToolbar ? 100 : 150, height: viewModel.hideToolbar ? 100 : 150)
                .cornerRadius(26)
                .foregroundStyle(
                    Color("PlaygroundComponents")
                )
            switch imageState {
            case .success(let image):
                image.resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8,style: .continuous))
                    .overlay(alignment: .topTrailing) {
                       Label("Remove Image", systemImage: "trash.circle.fill")
                           .font(.system(size: 30))
                           .labelStyle(.iconOnly)
                           .foregroundStyle(.white,Color.red)
                           .symbolRenderingMode(.palette)
                           .offset(x: 10, y: -10)
                       }
                       .frame(width: 90)
            case .loading:
                ProgressView()
            case .empty:
                Image(systemName: "photo.on.rectangle")
                    .font(.system(size: 40))
                    .foregroundStyle(Color("Dark Gray"))
                    .overlay(alignment: .topTrailing) {
                        Label("addImage", systemImage: "plus.circle.fill")
                            .font(.system(size: 30))
                            .labelStyle(.iconOnly)
                            .foregroundStyle(.white,Color.accentColor)
                            .symbolRenderingMode(.palette)
                            .offset(x: 10, y: -10)
                    }
                    .frame(width: 90)
            case .failure:
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
        }
        .offset(x: 3)
    }
}

struct GiftPickingView_Previews: PreviewProvider {
    static var previews: some View {
        GiftPickingView().environmentObject(WrappingViewModel())
    }
}
