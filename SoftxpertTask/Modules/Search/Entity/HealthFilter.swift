//
//  HealthFilter.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation

enum HealthFilter: String, CaseIterable {
    case ALL = "ALL"
    case LOW_SUGAR = "Low Sugar"
    case KETO = "Keto"
    case VEGAN = "Vegan"
    
    var query: String {
        switch self {
        case .ALL:
            return ""
        case .LOW_SUGAR:
            return "low-sugar"
        case .KETO:
            return "keto-friendly"
        case .VEGAN:
            return "vegan"
        }
    }
}
