//
//  Item.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import Foundation

struct Item: Codable, Identifiable {
    let id: UUID = UUID()
    var name: String
    var price: Double
}
