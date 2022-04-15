//
//  FilterViewModel.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 15/04/2022.
//

import Foundation

struct FilterViewModel {
    var name: String?
    
    init(filter: HealthFilter) {
        name = filter.rawValue
    }
}
