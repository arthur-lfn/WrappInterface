//
//  PlaceholderView.swift
//  wrapp
//
//  Created by Arturo Alfani on 01/03/23.
//

import SwiftUI

struct PlaceholderView: View {
    
    var fillColor: String
    var ribbonName: String
    var fontCustomName: String
    var fontDescription: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(fillColor))
                .frame(width: 150, height: 150)
                .cornerRadius(26)
            Image(ribbonName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 150, maxHeight: 150)
            Text(fontDescription)
                .font(.custom(fontCustomName, size: 22))
                .fontWeight(.heavy)
        }
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView(fillColor: "PlaygroundComponents", ribbonName: "Bow1", fontCustomName: "", fontDescription: "")
    }
}
