//
//  CustomModifiers.swift
//  wrapp
//
//  Created by Arturo Alfani on 20/02/23.
//

import SwiftUI

// List of modifiers applied to TextFields
struct CustomTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color("PlaygroundComponents"))
            .cornerRadius(6)
            .padding(3)
            .font(.headline)
    }
}

// Animation applied to features' texts
struct FeaturesAnimation: ViewModifier {
    var makeItColored: Bool
    var makeItBounce: Bool
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(makeItColored ? Color.accentColor : Color("FeaturesText"))
            .offset(y: makeItBounce ? -5 : 0)
            .shadow(color: makeItBounce ? Color("AccentColor") : Color.clear, radius: 20)
    }
}

// Fading of the Draft and Gift buttons
struct HideOrShowToolbar: ViewModifier {
    @EnvironmentObject var viewModel: WrappingViewModel
    
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                withAnimation {
                    viewModel.hideToolbar = true
                }
            }
            .onSubmit {
                withAnimation {
                    viewModel.hideToolbar = false
                }
            }
    }
}

extension View {
    func customTextField() -> some View {
        modifier(CustomTextField())
    }
    
    func animateFeature(makeItColored: Bool, makeItBounce: Bool) -> some View {
        modifier(FeaturesAnimation(makeItColored: makeItColored, makeItBounce: makeItBounce))
    }
    
    func hideOrShowToolbar() -> some View {
        modifier(HideOrShowToolbar())
    }
}

