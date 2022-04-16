//
//  UserDefaultsManager.swift
//  SoftxpertTask
//
//  Created by Belal Samy on 14/04/2022.
//


import Foundation

var Defaults = UserDefaultsManager.shared

struct UserDefaultsManager {
    
    //MARK: - singleton manager
    
    static var shared = UserDefaultsManager()
    private init() {}
    let def = UserDefaults.standard
    
    //MARK: - computed properties
  
    // computed propery for suggestionsArr
    var suggestionsArr: [String] {
        set {
            def.set(newValue, forKey: UserDefaultsKeys.suggestionsArr)
        } get {
            guard def.object(forKey: UserDefaultsKeys.suggestionsArr) != nil else {
                return ["Pizza", "Chicken", "Burger"]
            }
            return def.object(forKey: UserDefaultsKeys.suggestionsArr) as! [String]
        }
    }
}
