//
//  RoomCreationView.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import SwiftUI

struct RoomCreationView: View {
    @EnvironmentObject var budgetViewModel: BudgetViewModel
    @State private var roomName: String = ""
    @State private var itemName: String = ""
    @State private var itemCost: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Nome do Cômodo", text: $roomName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Nome do Item", text: $itemName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Custo do Item", text: $itemCost)
                    .keyboardType(.decimalPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    if let cost = Double(itemCost) {
                        budgetViewModel.addItemToRoom(roomName: roomName, item: Item(name: itemName, cost: cost))
                        itemName = ""
                        itemCost = ""
                    }
                }) {
                    Text("Adicionar Item")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                NavigationLink(destination: PreviewView()) {
                    Text("Próximo")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .navigationTitle("Criar Cômodos")
        }
    }
}
