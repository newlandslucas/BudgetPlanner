//
//  BudgetPlannerApp.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import SwiftUI

@main
struct BudgetPlannerApp: App {
    @StateObject private var budgetViewModel = BudgetViewModel()

    var body: some Scene {
        WindowGroup {
            BudgetEntryView()
                .environmentObject(budgetViewModel)
        }
    }
}
