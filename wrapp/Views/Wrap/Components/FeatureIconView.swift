//
//  FeatureIconView.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import SwiftUI

struct FeatureIconView: View {
    @EnvironmentObject var wrapViewModel : WrappingViewModel
    
    var theFeature: Feature
    
    var body: some View {
        Text(theFeature.text)
            .fontWeight(.heavy)
    }
}

struct FeatureIconView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureIconView(theFeature: Feature(text: "Feature", explaination: "this is a preview", featureStep: 2))
            .frame(width: 500, height: 500)
    }
}
