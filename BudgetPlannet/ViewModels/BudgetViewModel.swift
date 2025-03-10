//
//  BudgetViewModel.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import Foundation

class BudgetViewModel: ObservableObject {
    @Published var budget: Budget = Budget(value: 0, rooms: [])
    
    init() {
        loadBudget()
    }
    
    func setBudgetValue(_ value: Double) {
        budget.value = value
        saveBudget()
    }
    
    func addRoom(_ name: String) {
        budget.rooms.append(Room(name: name, items: []))
        saveBudget()
    }
    
    func removeRoom(_ room: Room) {
        budget.rooms.removeAll { $0.id == room.id }
        saveBudget()
    }
    
    private func saveBudget() {
        UserDefaultsManager.shared.saveBudget(budget)
    }
    
    private func loadBudget() {
        if let savedBudget = UserDefaultsManager.shared.loadBudget() {
            budget = savedBudget
        }
    }
}
