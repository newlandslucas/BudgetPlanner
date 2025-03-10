//
//  PreviewView.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import SwiftUI

struct PreviewView: View {
    @EnvironmentObject var budgetViewModel: BudgetViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(budgetViewModel.budget.rooms) { room in
                    Section(header: Text(room.name)) {
                        ForEach(room.items) { item in
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text("R$ \(item.cost, specifier: "%.2f")")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Preview")
            .toolbar {
                NavigationLink(destination: ShareBudgetView()) {
                    Text("Compartilhar")
                }
            }
        }
    }
}
