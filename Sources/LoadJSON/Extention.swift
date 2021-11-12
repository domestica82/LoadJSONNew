//
//  Extention.swift
//  NP
//
//  Created by Takashi Tsuruta on 2021/06/25.
//  Copyright © 2021 Takashi Tsuruta. All rights reserved.
//

import SwiftUI


extension Binding {
    static public func mock(_ value: Value) -> Self {
        var value = value
        return Binding(get: { value }, set: { value = $0 })
    }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder public func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
    @ViewBuilder public func sizeClassPadding(_ condition: @autoclosure () -> Bool, edge: Edge.Set, size: CGFloat) -> some View {
        if condition() {
            self.padding(edge, size)
        }else {
            self
        }
    }
    @ViewBuilder public func debugModifier<T: View>(_ modifier: (Self) -> T) -> some View {
        #if DEBUG
        modifier(self)
        #else
        self
        #endif
    }
//    @ViewBuilder public func NewPaddings(hSC: , edgeSet: [Edge.Set], paddingSet: [CGFloat], scale: CGFloat) -> some View {
//        if edgeSet.count == 1 {
//            self.padding(edgeSet[0], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[0] * scale) : CGFloat(paddingSet[0]))
//        }else if edgeSet.count == 2 {
//            self.padding(edgeSet[0], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[0] * scale) : CGFloat(paddingSet[0]))
//                .padding(edgeSet[1], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[1] * scale) : CGFloat(paddingSet[1]))
//        }else if edgeSet.count == 3 {
//            self.padding(edgeSet[0], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[0] * scale) : CGFloat(paddingSet[0]))
//                .padding(edgeSet[1], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[1] * scale) : CGFloat(paddingSet[1]))
//                .padding(edgeSet[2], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[2] * scale) : CGFloat(paddingSet[2]))
//        }else if edgeSet.count == 4 {
//            self.padding(edgeSet[0], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[0] * scale) : CGFloat(paddingSet[0]))
//                .padding(edgeSet[1], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[1] * scale) : CGFloat(paddingSet[1]))
//                .padding(edgeSet[2], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[2] * scale) : CGFloat(paddingSet[2]))
//                .padding(edgeSet[3], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[3]     * scale) : CGFloat(paddingSet[3]))
//        }
//    }
    public func debugBorder(_ color: Color = .red, width: CGFloat = 1) -> some View {
        debugModifier {
            $0.border(color, width: width)
        }
    }

    public func debugBackground(_ color: Color = .red) -> some View {
        debugModifier {
            $0.background(color)
        }
    }
    
    public func customPadding(edgeSet: [Edge.Set] = [.all], paddingSet: [CGFloat] = [10], scale: CGFloat = 1) -> some View {
        self.modifier(CustomPadding(edgeSet: edgeSet, paddingSet: paddingSet, scale: scale))
    }
    
    public func alertForiOS15(showingAlert: Binding<Bool> = .constant(false), contents: AlertContentsModel = AlertContentsModel(id: 1, title: "Test", message: "Hello!", buttonTitle1: nil, buttonTitle2: "Test"), action: Optional<(() -> Void)> = nil) -> some View {
        self.modifier(AlertForiOS15(showingAlert: showingAlert, contents: contents, action: action))
    }
}


extension Text {
    public func textBold(_ condition: @autoclosure () -> Bool) -> Text {
        if condition() {
            return self.bold()
        }else {
            return self
        }
    }
}

public func insertAlert(content: AlertContentsModel, text: String) -> AlertContentsModel{
    var result = content
    result.message = text
    return result
}


//For StartView, HomeView, ProfileView, ProfileEditView, DataExchangeView, UpgradePlanView, ContentsListView,
struct AlertForiOS15: ViewModifier {
    @Binding var showingAlert: Bool
    let contents: AlertContentsModel
    let action: (() -> Void)?
    
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                 .confirmationDialog(
                    contents.title,
                     isPresented: $showingAlert
                 ) {
                     if contents.buttonTitle1 != nil {
                         Button(contents.buttonTitle1!, role: .destructive) {
                             action!()
                         }
                     }
                     Button(contents.buttonTitle2, role:  .cancel) {
                         if contents.buttonTitle1 == nil && action != nil {
                             action!()
                         }
                     }
                 } message: {
                     Text(contents.message)
                 }
        } else {
            if contents.buttonTitle1 != nil && action != nil{
                content
                    .alert(isPresented: self.$showingAlert) {
                        Alert(
                            title: Text(contents.title),
                            message: Text(contents.message),
                            primaryButton: .cancel(Text(contents.buttonTitle2)),
                            secondaryButton: .destructive(Text(contents.buttonTitle1!), action: action!)
                        )
                    }
            }else if action != nil {
                content
                    .alert(isPresented: self.$showingAlert) {
                        Alert(
                            title: Text(contents.title),
                            message: Text(contents.message),
                            dismissButton: .default(Text(contents.buttonTitle2), action: action!)
                        )
                    }
            }else {
                content
                    .alert(isPresented: self.$showingAlert) {
                        Alert(
                            title: Text(contents.title),
                            message: Text(contents.message),
                            dismissButton: .default(Text(contents.buttonTitle2))
                        )
                    }
            }
        }
    }
}

extension ViewModifier{
    #if iOS
    enum DeviceTraitStatus {
        case wRhR
        case wChR
        case wRhC
        case wChC

        init(hSizeClass: UserInterfaceSizeClass?, vSizeClass: UserInterfaceSizeClass?) {

            switch (hSizeClass, vSizeClass) {
            case (.regular, .regular):
                self = .wRhR
            case (.compact, .regular):
                self = .wChR
            case (.regular, .compact):
                self = .wRhC
            case (.compact, .compact):
                self = .wChC
            default:
                self = .wChR
            }
        }
    }
    #endif
}


struct CustomPadding: ViewModifier {
    #if iOS
    @Environment(\.horizontalSizeClass) var hSC
    @Environment(\.verticalSizeClass) var vSC
    #endif
    var edgeSet: [Edge.Set]
    var paddingSet: [CGFloat]
    var scale: CGFloat
    
    func body(content: Content) -> some View {
    #if iOS
        let deviceTraitStatus = DeviceTraitStatus(hSizeClass: hSC, vSizeClass: vSC)
        if edgeSet.count == 1 {
            content
                .padding(edgeSet[0], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[0] * scale) : CGFloat(paddingSet[0]))
        }else if edgeSet.count == 2 {
            content
                .padding(edgeSet[0], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[0] * scale) : CGFloat(paddingSet[0]))
                .padding(edgeSet[1], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[1] * scale) : CGFloat(paddingSet[1]))
        }else if edgeSet.count == 3 {
            content
                .padding(edgeSet[0], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[0] * scale) : CGFloat(paddingSet[0]))
                .padding(edgeSet[1], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[1] * scale) : CGFloat(paddingSet[1]))
                .padding(edgeSet[2], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[2] * scale) : CGFloat(paddingSet[2]))
        }else if edgeSet.count == 4 {
            content
                .padding(edgeSet[0], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[0] * scale) : CGFloat(paddingSet[0]))
                .padding(edgeSet[1], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[1] * scale) : CGFloat(paddingSet[1]))
                .padding(edgeSet[2], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[2] * scale) : CGFloat(paddingSet[2]))
                .padding(edgeSet[3], deviceTraitStatus == .wRhR ? CGFloat(paddingSet[3]     * scale) : CGFloat(paddingSet[3]))
        }
        #elseif macOS
        content
            .padding(edgeSet[0], CGFloat(paddingSet[0]) * scale)
        #endif
    }
        
}

public struct Validation<Value>: ViewModifier {
    public var value: Value
    public var validator: (Value) -> Bool

    public func body(content: Content) -> some View {
        // Here we use Group to perform type erasure, to give our
        // method a single return type, as applying the 'border'
        // modifier causes a different type to be returned:
        Group {
            if validator(value) {
                content.border(Color.green)
            } else {
                content
            }
        }
    }
}

struct Extention_LibraryContent: LibraryContentProvider {
    var views: [LibraryItem] {
        LibraryItem(/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/)
    }
}
