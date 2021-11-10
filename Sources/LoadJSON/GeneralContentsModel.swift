//
//  SwiftUIView.swift
//  
//
//  Created by Takashi Tsuruta on 2021/11/10.
//

import SwiftUI

public struct GeneralContentsModel: Identifiable, Codable, Hashable{
    
    public let id: Int
    var name: String
    var tag: String
    var fontStyle: TextStyle
    var fontDesign: Design
    var markDown: Bool
    var isNeedBold: Bool
    var isNeedPadding: Bool
    var padding: [CGFloat]? = nil
    var scale: CGFloat? = nil
    
    enum TextStyle: String, CaseIterable, Codable, Hashable {
        case largeTitle = "largeTitle"
        case title = "title"
        case title2 = "title2"
        case title3 = "title3"
        case headline = "headline"
        case subheadline = "subheadline"
        case footnote = "footnote"
        case caption = "caption"
        case caption2 = "caption2"
        case body = "body"
        case callout = "callout"
    }
    
    enum Design: String, CaseIterable, Codable, Hashable {
        case serif = "serif"
        case `default` = "default"
        case monospaced = "monospaced"
        case rounded = "rounded"
    }
    
    enum EdgeSet: String, CaseIterable, Codable, Hashable {
        case top = "top"
        case horizontal = "horizontal"
        case bottom = "bottom"
        case all = "all"
        case vertical = "vertical"
        case leading = "leading"
        case trailing = "trailing"
    }
}

extension GeneralContentsModel: Comparable {
    public static func < (lhs: GeneralContentsModel, rhs: GeneralContentsModel) -> Bool {
        return lhs.id < rhs.id ? true : false
    }
    public static func > (lhs: GeneralContentsModel, rhs: GeneralContentsModel) -> Bool {
        return lhs.id > rhs.id ? true : false
    }
}

@available(macOS 11.0, *)
@available(iOS 14.0, *)
func changeTextStyle(type: GeneralContentsModel.TextStyle) -> Font.TextStyle {
    switch type {
    case .largeTitle:
        return .largeTitle
    case .title:
        return .title
    case .title2:
        return .title2
    case .title3:
        return .title3
    case .headline:
        return .headline
    case .subheadline:
        return .subheadline
    case .body:
        return .body
    case .callout:
        return .callout
    case .caption:
        return .caption
    case .caption2:
        return .caption2
    case .footnote:
        return .footnote
    }
}

@available(macOS 11.0, *)
@available(iOS 13.0, *)
func changeDesign(type: GeneralContentsModel.Design) -> Font.Design {
    switch type {
    case .serif:
        return .serif
    case .default:
        return .default
    case .rounded:
        return .rounded
    case .monospaced:
        return .monospaced
    }
}

@available(macOS 11.0, *)
@available(iOS 13.0, *)
func changePadding(edgeSet: [CGFloat]) -> [Edge.Set] {
    var changed: [Edge.Set] = [.all]
    if edgeSet.count == 2 {
        changed = [.horizontal, .vertical]
    }else if edgeSet.count == 3 {
        changed = [.top, .horizontal, .bottom]
    }else if edgeSet.count == 4 {
        changed = [.top, .leading, .trailing, .bottom]
    }
    return changed
}

public struct AlertContentsModel: Identifiable, Codable, Hashable{
    
    public let id: Int
    var title: String
    var message: String
    var buttonTitle1: String?
    var buttonTitle2: String

}
