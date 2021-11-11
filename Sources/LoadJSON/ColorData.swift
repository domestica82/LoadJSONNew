//
//  ColorData.swift
//  NP
//
//  Created by Takashi Tsuruta on 2020/05/09.
//  Copyright © 2020 Takashi Tsuruta. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
@available(macOS 11.0, *)
public struct ColorData {
    public static let blueStart = Color(red: 1 / 255, green: 54 / 255, blue: 97 / 255)
    public static let blueEnd = Color(red: 0 / 255, green: 10 / 255, blue: 19 / 255)
    public static let blueGradient = LinearGradient(
        gradient: .init(colors: [Self.blueStart, Self.blueEnd]),
        startPoint: .init(x: 0.5, y: 0.4),
        endPoint: .init(x: 0.5, y: 1)
    )
//    rgb(0,157,141)rgb(0,59,53)
    public static let greenStart = Color(red: 0 / 255, green: 157 / 255, blue: 141 / 255)
    public static let greenEnd = Color(red: 0 / 255, green: 59 / 255, blue: 53 / 255)
    public static let greenGradient = LinearGradient(
        gradient: .init(colors: [Self.greenStart, Self.greenEnd]),
        startPoint: .init(x: 0.5, y: 0.4),
        endPoint: .init(x: 0.5, y: 1)
    )
//    rgb(255,214,0)rgb(118,99,0)
    public static let yellowStart = Color(red: 255 / 255, green: 214 / 255, blue: 0 / 255)
    public static let yellowEnd = Color(red: 118 / 255, green: 99 / 255, blue: 0 / 255)
    public static let yellowGradient = LinearGradient(
        gradient: .init(colors: [Self.yellowStart, Self.yellowEnd]),
        startPoint: .init(x: 0.5, y: 0.4),
        endPoint: .init(x: 0.5, y: 1)
    )
//    rgb(83,183,87)rgb(38,91,40)
    public static let lightgreenStart = Color(red: 83 / 255, green: 183 / 255, blue: 87 / 255)
    public static let lightgreenEnd = Color(red: 38 / 255, green: 91 / 255, blue: 40 / 255)
    public static let lightgreenGradient = LinearGradient(
        gradient: .init(colors: [Self.lightgreenStart, Self.lightgreenEnd]),
        startPoint: .init(x: 0.5, y: 0.4),
        endPoint: .init(x: 0.5, y: 1)
    )
//    rgb(255,139,43)rgb(161,73,0)
    public static let orangeStart = Color(red: 255 / 255, green: 139 / 255, blue: 43 / 255)
    public static let orangeEnd = Color(red: 161 / 255, green: 73 / 255, blue: 0 / 255)
    public static let orangeGradient = LinearGradient(
        gradient: .init(colors: [Self.orangeStart, Self.orangeEnd]),
        startPoint: .init(x: 0.5, y: 0.4),
        endPoint: .init(x: 0.5, y: 1)
    )
    //    rgb(229,57,53)rgb(111,16,14)
    public static let redStart = Color(red: 229 / 255, green: 57 / 255, blue: 53 / 255)
    public static let redEnd = Color(red: 111 / 255, green: 16 / 255, blue: 14 / 255)
    public static let redGradient = LinearGradient(
        gradient: .init(colors: [Self.redStart, Self.redEnd]),
        startPoint: .init(x: 0.5, y: 0.4),
        endPoint: .init(x: 0.5, y: 1)
    )
    //    rgb(79,195,247)rgb(11,167,237)
    public static let lightblueStart = Color(red: 79 / 255, green: 195 / 255, blue: 247 / 255)
    public static let lightblueEnd = Color(red: 11 / 255, green: 167 / 255, blue: 237 / 255)
    public static let lightblueGradient = LinearGradient(
        gradient: .init(colors: [Self.lightblueStart, Self.lightblueEnd]),
        startPoint: .init(x: 0.5, y: 0.4),
        endPoint: .init(x: 0.5, y: 1)
    )
    //    rgb(144,164,174)rgb(101,126,138)
    public static let bluegreyStart = Color(red: 144 / 255, green: 164 / 255, blue: 174 / 255)
    public static let bluegreyEnd = Color(red: 101 / 255, green: 126 / 255, blue: 138 / 255)
    public static let bluegreyGradient = LinearGradient(
        gradient: .init(colors: [Self.bluegreyStart, Self.bluegreyEnd]),
        startPoint: .init(x: 0.5, y: 0.4),
        endPoint: .init(x: 0.5, y: 1)
    )

    //rgb(255,190,59)rgb(137,92,0) StrokeColor
    public static let storkeColorStart = Color(red: 255 / 255, green: 190 / 255, blue: 59 / 255)
    public static let storkeColorEnd = Color(red: 137 / 255, green: 92 / 255, blue: 0 / 255)
    public static let storkeColorGradient = LinearGradient(
        gradient: .init(colors: [Self.storkeColorStart, Self.storkeColorEnd]),
        startPoint: .init(x: 0.5, y: 0),
        endPoint: .init(x: 0.5, y: 1)
    )
    //rgb(255,210,118)rgb(255,204,98)
    public static let centerColorStart = Color(red: 255 / 255, green: 210 / 255, blue: 118 / 255)
    public static let centerColorEnd = Color(red: 255 / 255, green: 204 / 255, blue: 98 / 255)
    public static let centerColorGradient = LinearGradient(
        gradient: .init(colors: [Self.centerColorStart, Self.centerColorEnd]),
        startPoint: .init(x: 0.5, y: 0),
        endPoint: .init(x: 0.5, y: 1)
    )
    //rgb(121,194,102)rgb(67,127,51)
    public static let correctColorStart = Color(red: 121 / 255, green: 194 / 255, blue: 102 / 255)
    public static let correctColorEnd = Color(red: 67 / 255, green: 127 / 255, blue: 51 / 255)
    public static let correctColorGradient = LinearGradient(
        gradient: .init(colors: [Self.correctColorStart, Self.correctColorEnd]),
        startPoint: .init(x: 0.5, y: 0),
        endPoint: .init(x: 0.5, y: 1)
    )
    //rgb(76,100,110)rgb(52,68,75) For CardFill
    public static let centerDarkColorStart = Color(red: 76 / 255, green: 100 / 255, blue: 110 / 255)
    public static let centerDarkColorEnd = Color(red: 52 / 255, green: 68 / 255, blue: 75 / 255)
    public static let centerDarkColorGradient = LinearGradient(
        gradient: .init(colors: [Self.centerDarkColorStart, Self.centerDarkColorEnd]),
        startPoint: .init(x: 0.5, y: 0),
        endPoint: .init(x: 0.5, y: 1)
    )
    //    rgb(39,100,42)rgb(102,194,106)
    public static let gradientStart = Color(red: 102 / 255, green: 194 / 255, blue: 106 / 255)
    public static let gradientEnd = Color(red: 39 / 255, green: 100 / 255, blue: 42 / 255)
    public static let backGradient = LinearGradient(
        gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
        startPoint: .init(x: 0, y: 0),
        endPoint: .init(x: 1, y: 1)
    )
    //    rgb(230,74,25)rgb(238,130,96)
    public static let gradientStart2 = Color(red: 238 / 255, green: 130 / 255, blue: 96 / 255)
    public static let gradientEnd2 = Color(red: 230 / 255, green: 74 / 255, blue: 25 / 255)
    public static let backGradient2 = LinearGradient(
        gradient: .init(colors: [Self.gradientStart2, Self.gradientEnd2]),
        startPoint: .init(x: 0, y: 0),
        endPoint: .init(x: 1, y: 1)
    )
    //rgb(55,71,79) rgb(23,23,23)
    public static let darkGreyStart = Color(red: 55 / 255, green: 71 / 255, blue: 79 / 255)
    public static let darkGreyEnd = Color(red: 23 / 255, green: 23 / 255, blue: 23 / 255)
    public static let darkGreyGradient = LinearGradient(
        gradient: .init(colors: [Self.darkGreyStart, Self.darkGreyEnd]),
        startPoint: .init(x: 0, y: 0),
        endPoint: .init(x: 1, y: 1)
    )
    //rgb(159,180,190)
    public static let lightDarkGrey = Color(red: 159 / 255, green: 180 / 255, blue: 190 / 255)
    
    //rgb(156,178,187)
    public static let cardGreyStart = Color.white
    public static let cardGreyEnd = Color(red: 156 / 255, green: 178 / 255, blue: 187 / 255)
    public static let cardGreyGradient = LinearGradient(
        gradient: .init(colors: [Self.cardGreyStart, Self.cardGreyEnd]),
        startPoint: .init(x: 0.5, y: 0),
        endPoint: .init(x: 0.5, y: 1)
    )
    //rgb(54,71,79)rgb(28,37,40)
    public static let cardDarkGreyStart = Color(red: 54 / 255, green: 71 / 255, blue: 79 / 255)
    public static let cardDarkGreyEnd = Color(red: 28 / 255, green: 37 / 255, blue: 40 / 255)
    public static let cardDarkGreyGradient = LinearGradient(
        gradient: .init(colors: [Self.cardDarkGreyStart, Self.cardDarkGreyEnd]),
        startPoint: .init(x: 0.5, y: 0),
        endPoint: .init(x: 0.5, y: 1)
    )
    //rgb(255,224,130)rgb(255,209,71)rgb(255,195,12)
    public static let supportYellow1 = Color(red: 255 / 255, green: 224 / 255, blue: 130 / 255)
    public static let supportYellow2 = Color(red: 255 / 255, green: 209 / 255, blue: 71 / 255)
    public static let supportYellow3 = Color(red: 255 / 255, green: 195 / 255, blue: 12 / 255)
    //rgb(196,165,0)rgb(157,132,0)rgb(118,99,0)
    public static let supportDarkYellow1 = Color(red: 196 / 255, green: 165 / 255, blue: 0 / 255)
    public static let supportDarkYellow2 = Color(red: 157 / 255, green: 132 / 255, blue: 0 / 255)
    public static let supportDarkYellow3 = Color(red: 118 / 255, green: 99 / 255, blue: 0 / 255)
    
}
