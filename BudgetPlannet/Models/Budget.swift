//
//  Budget.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import Foundation

struct Budget: Codable {
    var value: Double
    var rooms: [Room]
}
