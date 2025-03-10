//
//  Budget.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import Foundation

struct Budget: Identifiable {
    let id = UUID()
    var totalAmount: Double
    var rooms: [Room] = []
    
    var remainingAmount: Double {
        let totalSpent = rooms.reduce(0) { $0 + $1.totalCost }
        return totalAmount - totalSpent
    }
}
