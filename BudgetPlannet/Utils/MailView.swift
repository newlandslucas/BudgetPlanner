//
//  MailView.swift
//  BudgetPlannet
//
//  Created by Lucas Newlands on 10/03/25.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    @Binding var isShowing: Bool
    var budget: Budget

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let mail = MFMailComposeViewController()
        mail.setSubject("Orçamento da Casa")
        
        // Formata os valores usando String(format:)
        let totalAmount = String(format: "R$ %.2f", budget.totalAmount)
        let totalSpent = String(format: "R$ %.2f", budget.totalAmount - budget.remainingAmount)
        let remainingAmount = String(format: "R$ %.2f", budget.remainingAmount)
        
        let body = """
        Orçamento Total: \(totalAmount)
        Total Gasto: \(totalSpent)
        Saldo Restante: \(remainingAmount)
        """
        
        mail.setMessageBody(body, isHTML: false)
        mail.mailComposeDelegate = context.coordinator
        return mail
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MailView

        init(_ parent: MailView) {
            self.parent = parent
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            parent.isShowing = false
        }
    }
}
