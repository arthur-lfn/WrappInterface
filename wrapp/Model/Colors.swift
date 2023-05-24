//
//  Colors.swift
//  wrapp
//
//  Created by Arturo Alfani on 22/02/23.
//

import Foundation

struct WidgetTheme: Identifiable {
    var id = UUID()
    var colorThemeName: String
}

let colorAccent = WidgetTheme(colorThemeName: "AccentColor")
let colorPurple = WidgetTheme(colorThemeName: "Purple")
let colorIndigo = WidgetTheme(colorThemeName: "Indigo")
let colorLilac =  WidgetTheme(colorThemeName: "Lilac")
let colorOrange = WidgetTheme(colorThemeName: "Orange")
let colorRed = WidgetTheme(colorThemeName: "Red")
let colorBlack = WidgetTheme(colorThemeName: "Black")

