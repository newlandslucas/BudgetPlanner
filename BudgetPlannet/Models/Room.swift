//
//  Room.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import Foundation

struct Room: Codable, Identifiable {
    let id: UUID = UUID()
    var name: String
    var items: [Item]
}
