//
//  SwiftUIView.swift
//  
//
//  Created by Takashi Tsuruta on 2021/11/10.
//

import SwiftUI

//For iOS14
public struct TmpTextStyle: Identifiable{
    public var id: Int
    var sentence: String
    var isBold: Bool
}
//For iOS14
func boldableText(contents: GeneralContentsModel) -> [TmpTextStyle]{
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

func insertString(content: GeneralContentsModel, text: String) -> GeneralContentsModel{
    var result = content
    result.name = text
    return result
}


@available(macOS 12.0, *)
@available(iOS 13.0, *)
public struct TextStyle: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var contents: GeneralContentsModel
    let section: Bool
    let alert: Bool
    
    public var body: some View {
        let thisTag = contents.tag
        let horiAlignment: HorizontalAlignment = thisTag.contains("center") ? .center : thisTag.contains("trailing") ? .trailing : .leading
        let supportCard: Color = colorScheme == .light ? ColorData.blueStart : Color.white
        let isLightMode: Color = colorScheme == .light ? Color.white : ColorData.lightDarkGrey
        let cardTitle: Color = colorScheme == .light ? Color.black : Color.white
        let colorMode: Color = thisTag.contains("date") ? Color.secondary : thisTag.contains("supportCard") ? supportCard : thisTag.contains("contact-link") || thisTag.contains("master") ? Color.yellow :
        thisTag.contains("gameContent") ? ColorData.bluegreyStart : thisTag.contains("cardTitle") ? cardTitle :  isLightMode
        let edgeSet = contents.isNeedPadding ? changePadding(edgeSet: contents.padding!) : []
        VStack(alignment: .leading){
            if section {
                Group{
                    if #available(iOS 15.0, *){
                        Text(contents.tag)
                            .foregroundColor(isLightMode)
                            .font(.body)
                            .bold()
                            .italic()   //For English, not for Japanese
//                            .dynamicTypeSize(...DynamicTypeSize.accessibility5)
                    }else {
                        Text(contents.tag)
                            .foregroundColor(isLightMode)
                            .font(.body)
                            .bold()
                            .italic()   //For English, not for Japanese
                    }
                }
                .padding()
            }
            VStack(alignment: horiAlignment){
                if #available(iOS 15.0, *){
                    if alert {
                        Text(AttributedText(contents: contents, alert: alert, textColor: colorMode))
//                            .dynamicTypeSize(...DynamicTypeSize.accessibility5)
                    }else {
                        Text(LocalizedStringKey(contents.name))
                            .foregroundColor(colorMode)
                            .font(.system(changeTextStyle(type: contents.fontStyle), design: changeDesign(type: contents.fontDesign)))
//                            .dynamicTypeSize(...DynamicTypeSize.accessibility5)
                    }
                }else {
                    if thisTag.contains("subscription-link") {
                        Link("サブスクリプション設定画面へ", destination: URL(string: "https://support.apple.com/ja-jp/HT202039")!)
                            .customPadding(edgeSet: [.top, .horizontal, .bottom], paddingSet: [0, 10, 20], scale: 2)
                    }else if thisTag.contains("google-link") {
                        Link("Googleのプライバシーポリシー", destination: URL(string: "https://policies.google.com/privacy?hl=ja")!)
                            .customPadding(edgeSet: [.top, .horizontal, .bottom], paddingSet: [0, 10, 10], scale: 2)
                    }else {
                        ForEach(boldableText(contents: contents)){content in
                            Text(content.sentence)
                                .textBold(content.isBold)
                                .foregroundColor(colorMode)
                                .font(.system(changeTextStyle(type: contents.fontStyle), design: changeDesign(type: contents.fontDesign)))
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .init(horizontal: horiAlignment, vertical: .center))
            .if(contents.isNeedPadding){ view in
                view.customPadding(edgeSet: edgeSet, paddingSet: contents.padding!, scale: contents.scale!)
            }
        }
    }
}

@available(macOS 12, *)
@available(iOS 15, *)
func AttributedText(contents: GeneralContentsModel, alert: Bool, textColor: Color) -> AttributedString {
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
