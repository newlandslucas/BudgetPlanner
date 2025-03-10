//
//  BudgetEntryView.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import SwiftUI

struct BudgetEntryView: View {
    @EnvironmentObject var budgetViewModel: BudgetViewModel
    @State private var budgetAmount: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Informe seu orçamento", text: $budgetAmount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                NavigationLink(destination: RoomCreationView()) {
                    Text("Próximo")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(budgetAmount.isEmpty)
            }
            .padding()
            .navigationTitle("Orçamento")
        }
        .onChange(of: budgetAmount) { newValue in
            if let amount = Double(newValue) {
                budgetViewModel.setBudget(amount: amount)
            }
        }
    }
}
