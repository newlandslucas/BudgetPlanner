//
//  MessageView.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import SwiftUI
import MessageUI

struct MessageView: UIViewControllerRepresentable {
    @Binding var isShowing: Bool
    var budget: Budget

    func makeUIViewController(context: Context) -> MFMessageComposeViewController {
        let message = MFMessageComposeViewController()
        
        // Formata os valores usando String(format:)
        let totalAmount = String(format: "R$ %.2f", budget.totalAmount)
        let totalSpent = String(format: "R$ %.2f", budget.totalAmount - budget.remainingAmount)
        let remainingAmount = String(format: "R$ %.2f", budget.remainingAmount)
        
        message.body = """
        Orçamento Total: \(totalAmount)
        Total Gasto: \(totalSpent)
        Saldo Restante: \(remainingAmount)
        """
        
        message.messageComposeDelegate = context.coordinator
        return message
    }

    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        var parent: MessageView

        init(_ parent: MessageView) {
            self.parent = parent
        }

        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            parent.isShowing = false
        }
    }
}
