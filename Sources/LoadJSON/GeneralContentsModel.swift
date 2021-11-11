//
//  SwiftUIView.swift
//  
//
//  Created by Takashi Tsuruta on 2021/11/10.
//

import SwiftUI


public extension GeneralContentsModel{
    enum TextSize: String, CaseIterable, Codable, Hashable {
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



public struct GeneralContentsModel: Identifiable, Codable, Hashable{
    
    public let id: Int
    public var name: String
    public var tag: String
    public var fontStyle: TextSize
    public var fontDesign: Design
    public var markDown: Bool
    public var isNeedBold: Bool
    public var isNeedPadding: Bool
    public var padding: [CGFloat]?
    public var scale: CGFloat?
    
    
    internal init(id: Int, name: String, tag: String, fontStyle: TextSize, fontDesign: Design, markDown: Bool, isNeedBold: Bool, isNeedPadding: Bool, padding: Optional<[CGFloat]> = nil, scale: Optional<CGFloat> = nil){
        self.id = id
        self.name = name
        self.tag = tag
        self.fontStyle = fontStyle
        self.fontDesign = fontDesign
        self.markDown = markDown
        self.isNeedBold = isNeedBold
        self.isNeedPadding = isNeedPadding
        self.padding = padding
        self.scale = scale
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

public func changeTextStyle(type: GeneralContentsModel.TextSize) -> Font.TextStyle {
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


public func changeDesign(type: GeneralContentsModel.Design) -> Font.Design {
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


public func changePadding(edgeSet: [CGFloat]) -> [Edge.Set] {
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
    public var title: String
    public var message: String
    public var buttonTitle1: String?
    public var buttonTitle2: String
    
    public init(id: Int, title: String, message: String, buttonTitle1: Optional<String> = nil, buttonTitle2: String){
        self.id = id
        self.title = title
        self.message = message
        self.buttonTitle1 = buttonTitle1
        self.buttonTitle2 = buttonTitle2
    }
 

}
