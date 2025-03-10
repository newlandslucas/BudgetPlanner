//
//  BudgetViewModel.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import Foundation

class BudgetViewModel: ObservableObject {
    @Published var budget = Budget(totalAmount: 0)

    func setBudget(amount: Double) {
        budget.totalAmount = amount
    }

    func addItemToRoom(roomName: String, item: Item) {
        if let index = budget.rooms.firstIndex(where: { $0.name == roomName }) {
            budget.rooms[index].items.append(item)
        } else {
            let newRoom = Room(name: roomName, items: [item])
            budget.rooms.append(newRoom)
        }
    }
}
