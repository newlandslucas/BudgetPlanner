//
//  ShareBudgetView.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import SwiftUI
import MessageUI

struct ShareBudgetView: View {
    @EnvironmentObject var budgetViewModel: BudgetViewModel
    @State private var isShowingMailView = false
    @State private var isShowingMessageView = false

    var body: some View {
        VStack {
            Text("Orçamento Total: R$ \(budgetViewModel.budget.totalAmount, specifier: "%.2f")")
            Text("Total Gasto: R$ \(budgetViewModel.budget.totalAmount - budgetViewModel.budget.remainingAmount, specifier: "%.2f")")
            Text("Saldo Restante: R$ \(budgetViewModel.budget.remainingAmount, specifier: "%.2f")")

            Button(action: {
                isShowingMessageView = true
            }) {
                Text("Compartilhar via iMessage")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Button(action: {
                isShowingMailView = true
            }) {
                Text("Compartilhar via Email")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Compartilhar Orçamento")
        .sheet(isPresented: $isShowingMailView) {
            MailView(isShowing: $isShowingMailView, budget: budgetViewModel.budget)
        }
        .sheet(isPresented: $isShowingMessageView) {
            MessageView(isShowing: $isShowingMessageView, budget: budgetViewModel.budget)
        }
    }
}
