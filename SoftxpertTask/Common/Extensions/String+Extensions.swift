//
//  String+Extensions.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation

extension String {
    var isOnlyEnglishAndWhiteSpaces: Bool {
        // [] = range
        // a-z = small case letters from a to z
        // A-z = capital case letters from A to Z
        // \\s = \\ to allow metacharcters, s = for whitespaces
        NSPredicate(format: "SELF MATCHES %@", "[a-zA-Z\\s]").evaluate(with: self)
    }
}
