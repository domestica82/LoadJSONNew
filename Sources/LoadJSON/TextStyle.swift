//
//  SwiftUIView.swift
//  
//
//  Created by Takashi Tsuruta on 2021/11/10.
//

import SwiftUI


@available(iOS, deprecated: 14.0)
public struct TmpTextStyle: Identifiable{
    public var id: Int
    public var sentence: String
    public var isBold: Bool
    
    public init(id: Int, sentence: String, isBold: Bool){
        self.id = id
        self.sentence = sentence
        self.isBold = isBold
    }
}

@available(iOS, deprecated: 14.0)
public func boldableText(contents: GeneralContentsModel) -> [TmpTextStyle]{
    var result: [TmpTextStyle] = []
    let name = contents.name
    if name.contains("\n\n") {
        let splitedList = name.split(whereSeparator: {$0 == "\n"})
        let count = splitedList.count - 1
        for i in 0...count {
            var sentence = i == 0 ? String(splitedList[i]) : "\n" + String(splitedList[i])
            if splitedList[i].contains("**") {
                let unBoldList = splitedList[i].split(whereSeparator: {$0 == "*"})
                sentence = i == 0 ? String(unBoldList[0]) : "\n\n\n" + String(unBoldList[0])
                result.append(TmpTextStyle(id: i, sentence: sentence, isBold: true))
            }else {
                result.append(TmpTextStyle(id: i, sentence: sentence, isBold: false))
            }
        }
    }else {
        if name.contains("**") {
            let unBoldList = name.split(whereSeparator: {$0 == "*"})
            result.append(TmpTextStyle(id: 0, sentence: String(unBoldList[0]), isBold: true))
        }else {
            result.append(TmpTextStyle(id: 0, sentence: name, isBold: false))
        }
    }
    return result
}

public func insertString(content: GeneralContentsModel, text: String) -> GeneralContentsModel{
    var result = content
    result.name = text
    return result
}



@available(iOS 15, *)
public func AttributedText(contents: GeneralContentsModel, alert: Bool, textColor: Color) -> AttributedString {
    var string =  try! AttributedString(markdown: contents.name)
    if contents.name.contains("\n\n") {
        let splitedList = contents.name.split(whereSeparator: {$0 == "\n"})
        var firstString =  try! AttributedString(markdown: String(splitedList[0]))
        if alert{
            firstString.font = .system(.body, design: changeDesign(type: contents.fontDesign))
        }
        string = firstString
        let count = splitedList.count - 1
        for i in 1...count {
            var atr = try! AttributedString(markdown: String(splitedList[i]))
        if alert{
            atr.font = .system(.footnote, design: changeDesign(type: contents.fontDesign))
        }
        string += AttributedString("\n\n") + atr
        }
    }
    string.foregroundColor = textColor
    if !alert{
        string.font = .system(changeTextStyle(type: contents.fontStyle), design: changeDesign(type: contents.fontDesign))
    }
    return string
}
