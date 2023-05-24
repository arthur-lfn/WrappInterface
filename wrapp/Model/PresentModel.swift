//
//  PresentModel.swift
//  wrapp
//
//  Created by Arturo Alfani on 21/02/23.
//

import SwiftUI
import PhotosUI
import CoreTransferable

struct Gift: Identifiable {
    var id = UUID()
    var name: String = ""
    var personalNote: String = ""
    var openingGiftDate: Date = Date.now.addingTimeInterval(129600) // 129600 seconds equals 1.5 days
    var giftImage: PhotosPickerItem? = PhotosPickerItem(itemIdentifier: "ok")
    var giftWidgetImage: GiftWidgetImage = GiftWidgetImage()
}

struct GiftWidgetImage: Identifiable {
    var id = UUID()
    var colorWidget: String = "AccentColor"
    var ribbonName: String = "Bow1"
    var fontName: String = "SFPro-Regular"
    var snapshotWidgetImage: Snap = Snap()
}

struct Snap: Transferable {
    public var image: Image = Image("snap")
    public var caption: String = "Hey! You have received a wrapp!"
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
}
