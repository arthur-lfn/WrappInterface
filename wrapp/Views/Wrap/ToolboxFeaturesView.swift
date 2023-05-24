//
//  ToolboxFeaturesView.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import SwiftUI

struct ToolboxFeaturesView: View {
    @EnvironmentObject var wrapViewModel: WrappingViewModel

    var body: some View {
        VStack {
            ZStack {
                Grid(horizontalSpacing: 55) {
                    GridRow {
                        ForEach(allFeatures) { feat in
                            ZStack {
                                Button() {
                                    withAnimation {
                                        wrapViewModel.featureStep = feat.featureStep
                                        wrapViewModel.isFeatureActive = true
                                        wrapViewModel.hideToolbar = false
                                    }
                                    Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { _ in
                                        withAnimation {
                                            wrapViewModel.isFeatureActive = false
                                        }
                                    }
                                } label: {
                                    ZStack {
                                        FeatureIconView(theFeature: feat)
                                            .animateFeature(
                                                makeItColored: wrapViewModel.featureStep == feat.featureStep,
                                                makeItBounce: wrapViewModel.featureStep == feat.featureStep ? wrapViewModel.isFeatureActive : false)
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
            
            Divider()
                    
        }
    }
}
    
struct ToolboxFeaturesView_Previews: PreviewProvider {
    static var previews: some View {
        ToolboxFeaturesView().environmentObject(WrappingViewModel())
    }
}
    
