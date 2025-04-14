//
//  LocalState.swift
//  Bankey
//
//  Created by Bento, Cesar on 14/04/25.
//

import Foundation

class LocalState {
    private enum Keys: String {
        case hasOnboarded
    }
    
    static var hasOnboarded: Bool {
        get {
            UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        } set {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
        }
    }
}
