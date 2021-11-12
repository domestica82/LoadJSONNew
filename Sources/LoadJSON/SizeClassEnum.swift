//
//  SizeClassEnum.swift
//  NP
//
//  Created by Takashi Tsuruta on 2021/06/19.
//  Copyright © 2021 Takashi Tsuruta. All rights reserved.
//

import SwiftUI

#if os(macOS)
public enum UserInterfaceSizeClass {
    case compact
    case regular
}

public struct HorizontalSizeClassEnvironmentKey: EnvironmentKey {
    static public let defaultValue: UserInterfaceSizeClass = .regular
}
public struct VerticalSizeClassEnvironmentKey: EnvironmentKey {
    static public let defaultValue: UserInterfaceSizeClass = .regular
}

extension EnvironmentValues {
    public var horizontalSizeClass: UserInterfaceSizeClass {
        get { return self[HorizontalSizeClassEnvironmentKey.self] }
        set { self[HorizontalSizeClassEnvironmentKey.self] = newValue }
    }
    public var verticalSizeClass: UserInterfaceSizeClass {
        get { return self[VerticalSizeClassEnvironmentKey.self] }
        set { self[VerticalSizeClassEnvironmentKey.self] = newValue }
    }
}
#endif

public enum DeviceTraitStatus {
    case wRhR
    case wChR
    case wRhC
    case wChC

    public init(hSizeClass: UserInterfaceSizeClass?, vSizeClass: UserInterfaceSizeClass?) {

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
