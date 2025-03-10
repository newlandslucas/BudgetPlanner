//
//  Item.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    var name: String
    var cost: Double
}
