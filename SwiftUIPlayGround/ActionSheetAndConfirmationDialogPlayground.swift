//
//  ActionSheetAndConfirmationDialogPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 09/05/2023.
//

import SwiftUI

// When we want the user to make a choice between two or more options.

// Action Sheet: iOS 14 or below.
// Confirmation Dialog: iOS 15 or later.

struct ActionSheetAndConfirmationDialogPlayground: View {
    @State private var isConfirm = false
    
    var body: some View {
        Button("Transfer Funds") {
            isConfirm.toggle()
        }
        .buttonStyle(.borderedProminent)
        // iOS 15 or above
//        .confirmationDialog("Funds Transfer Confirmation", isPresented: $isConfirm, titleVisibility: .visible) {
//            Button("Confirm") {}
//            Button("Delete", role: .destructive) {}
//        } message: {
//            Text("Are you willing to transfer this funds?")
//        }
        // iOS 14 or below.
        .actionSheet(isPresented: $isConfirm) {
            ActionSheet(
                title: Text("Funds Transfer Confirmation"),
                message: Text("Are you willing to transfer this fund?"),
                buttons: [
                    .default(Text("Confrim")),
                    .destructive(Text("Delete"))
                ]
            )
        }
    }
}

struct ActionSheetAndConfirmationDialogPlayground_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetAndConfirmationDialogPlayground()
    }
}
