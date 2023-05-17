//
//  DatePickerPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 17/05/2023.
//

import Foundation
import SwiftUI

/*
 
 DatePicker: Control for selecting date/time. We can use DatePicker to allow user to select calendar date and optionally time.
 
 */

struct DatePickerPlayground: View {
    @State private var selectedDate = Date()
    
    var dateRange: ClosedRange<Date> {
        let calendar = Calendar.current
        let start = DateComponents(year: 2020, month: 2, day: 1)
        let end = DateComponents(year: 2022, month: 2, day: 1)
        return calendar.date(from: start)! ... calendar.date(from: end)!
    }
    
    var body: some View {
        VStack {
            DatePicker(
                "Select Date",
                selection: $selectedDate,
                //in: ...Date(),
                in: dateRange,
                displayedComponents: [.date, .hourAndMinute]
            )
            .datePickerStyle(.compact)
            
            DatePicker(selection: $selectedDate) {
                Label("Select Your birth date", systemImage: "calendar")
            }
        }
        .padding()
    }
}

struct DatePickerPlayground_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerPlayground()
    }
}
