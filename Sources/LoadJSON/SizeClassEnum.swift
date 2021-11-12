//
//  SizeClassEnum.swift
//  NP
//
//  Created by Takashi Tsuruta on 2021/06/19.
//  Copyright © 2021 Takashi Tsuruta. All rights reserved.
//

import SwiftUI

#if iOS
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
#endif
