//
//  User.swift
//  StrollOne
//
//  Created by Ashraf Alif Adillah on 27/09/25.
//

import Foundation

struct User: Codable {
    let id: UUID = UUID()
    let name: String
    let age: Int
}
