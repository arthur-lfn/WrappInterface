//
//  WrappingViewModel.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import SwiftUI
import PhotosUI

@MainActor
class WrappingViewModel: ObservableObject {
    
    @Published var hideToolbar = false
    @Published var featureStep : Int = 1
    @Published var isFeatureActive : Bool = false
    @Published var featureExplained : String = ""
    
    @Published var gift = Gift()
    
    @Published var allRibbons: [Ribbon] = [
        Ribbon(ribbonName: "Bow1"),
        Ribbon(ribbonName: "Bow2"),
        Ribbon(ribbonName: "Bow3")
    ]
    @Published var allFonts: [CustomFont] = [
        CustomFont(fontCustomName: "SFPro-Regular", description: "SF Pro"),
        CustomFont(fontCustomName: "NewYork-Regular", description: "New York"),
    ]
    @Published var allWidgetTheme : [WidgetTheme] = [
        colorAccent, colorRed, colorOrange, colorIndigo, colorPurple ,colorBlack
    ]
    
     var currentEditingFeature : Feature {
        Feature(text: "feature", explaination: featureExplained, featureStep : featureStep)
    }
    
    // MARK: - Gift Image from PhotoPickerDemo
    
    enum GiftImageState {
        case empty
        case loading(Progress)
        case success(Image)
        case failure(Error)
    }
    
    enum TransferError: Error {
        case importFailed
    }
    
    struct GiftImage: Transferable {
        let image: Image
        
        static var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
            #if canImport(AppKit)
                guard let nsImage = NSImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(nsImage: nsImage)
                return ProfileImage(image: image)
            #elseif canImport(UIKit)
                guard let uiImage = UIImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(uiImage: uiImage)
                return GiftImage(image: image)
            #else
                throw TransferError.importFailed
            #endif
            }
        }
    }
    
    @Published private(set) var giftImageStatetoHide: GiftImageState = .empty
    
    @Published var giftImageSelection: PhotosPickerItem? = nil {
        didSet {
            if let giftImageSelection {
                let progress = loadTransferable(from: giftImageSelection)
                giftImageStatetoHide = .loading(progress)
            } else {
                giftImageStatetoHide = .empty
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
        return imageSelection.loadTransferable(type: GiftImage.self) { result in
            DispatchQueue.main.async {
                guard imageSelection == self.giftImageSelection else {
                    print("Failed to get the selected item.")
                    return
                }
                switch result {
                case .success(let giftImage?):
                    self.giftImageStatetoHide = .success(giftImage.image)
                case .success(nil):
                    self.giftImageStatetoHide = .empty
                case .failure(let error):
                    self.giftImageStatetoHide = .failure(error)
                }
            }
        }
    }
}


