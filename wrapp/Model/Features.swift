//
//  Features.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import Foundation

struct Feature: Identifiable {
    var id = UUID()
    var text: String
    var explaination: String
    var featureStep: Int
    var showExplanation: Bool = true
}

var selectUnlockDate: Feature = Feature(text: "Date", explaination: String(localized: "date"), featureStep: 1)
var selectGift: Feature = Feature(text: "Upload", explaination: String(localized: "gift"), featureStep: 2)
var selectWidgetTheme: Feature = Feature(text: "Wrap", explaination: String(localized: "skin"), featureStep: 3)
var selectFont: Feature = Feature(text: "Font", explaination: String(localized: "font"), featureStep: 4)

var allFeatures: [Feature] = [
    selectUnlockDate,
    selectGift,
    selectWidgetTheme,
    selectFont
]
