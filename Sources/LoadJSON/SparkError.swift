//
//  SparkError.swift
//  NP
//
//  Created by Takashi Tsuruta on 2020/05/09.
//  Copyright © 2020 Takashi Tsuruta. All rights reserved.
//
//
import Foundation


public struct SignInWithAppleAuthError: Error {
    static let noAuthDataResult = NSError(domain: "No Auth Data Result", code: 300, userInfo: nil)
    static let noIdentityToken = NSError(domain: "Unable to fetch identity token", code: 301, userInfo: nil)
    static let noIdTokenString = NSError(domain: "Unable to serialize token string from data", code: 302, userInfo: nil)
    static let noAppleIDCredential = NSError(domain: "Unable to create Apple ID Credential", code: 303, userInfo: nil)
}
