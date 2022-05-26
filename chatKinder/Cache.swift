//
//  Cache.swift
//  chatKinder
//
//  Created by Azizbek Salimov on 26.05.2022.
//

import Foundation

class Cache {
  static  let shared: Cache = Cache()
    
    func saveUser(id: Int, name: String) {
        UserDefaults.standard.set(id, forKey: Keys.id)
        UserDefaults.standard.set(name, forKey: Keys.name)
    }
    
    func getUserName() -> String{
        return UserDefaults.standard.string(forKey: Keys.name)!
    }
    
    func getUserId() -> Int {
        return UserDefaults.standard.integer(forKey: Keys.id)
    }
    
}

class Keys {
    static let id = "id"
    static let name = "name"
}


