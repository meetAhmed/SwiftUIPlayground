//
//  AlertPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 08/05/2023.
//

import SwiftUI

// Alert: Display information, error, or ask user about their choice.

struct Account: Identifiable {
    let id = UUID().uuidString
    let amount: Int
}

struct AlertPlayground: View {
    @State private var showAlert = false
    @State private var account: Account? = nil
    
    var body: some View {
        VStack {
            Button("Transfer Funds") {
                account = Account(amount: 5000)
                showAlert.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        // iOS 15.0 and later
//        .alert("Funds Transfer Confirmation", isPresented: $showAlert, presenting: account) { account in
//            Button("Confirm") {}
//            Button("Delete Transaction", role: .destructive) {}
//        } message: { account in
//            Text("Are you willing to transfer \(account.amount) funds?")
//        }
        // iOS 13, and 14
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Funds Transfer Confirmation"), message: Text("Are you willing to transfer?"), dismissButton: .cancel())
        }
    }
}

struct AlertPlayground_Previews: PreviewProvider {
    static var previews: some View {
        AlertPlayground()
    }
}
