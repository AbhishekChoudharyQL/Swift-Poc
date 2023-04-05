//
//  Extensions.swift
//  MusicApp
//
//  Created by abhishek on 04/04/23.
//

import Foundation
import SwiftUI

extension Color {
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    static let backgroundColor = Color.rgb(r: 21, g: 22, b: 33)
//    static let buttonColor = Color.rgb(r: 252, g: 125, b: 218)
    //SliderAccent
    static let buttonColor = Color("SliderAccent")
}
