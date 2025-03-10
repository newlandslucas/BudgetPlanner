//
//  Room.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import Foundation

struct Room: Identifiable {
    let id = UUID()
    var name: String
    var items: [Item] = []
    
    var totalCost: Double {
        items.reduce(0) { $0 + $1.cost }
    }
}
