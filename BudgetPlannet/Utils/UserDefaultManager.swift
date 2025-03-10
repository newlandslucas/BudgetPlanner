//
//  UserDefaultManager.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let key = "budgetData"
    
    func saveBudget(_ budget: Budget) {
        if let encoded = try? JSONEncoder().encode(budget) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func loadBudget() -> Budget? {
        if let savedData = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode(Budget.self, from: savedData) {
            return decoded
        }
        return nil
    }
}
