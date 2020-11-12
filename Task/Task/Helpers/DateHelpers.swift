//
//  DateHelpers.swift
//  Task
//
//  Created by Jeremy Taylor on 11/11/20.
//

import Foundation

extension Date {

    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium

        return formatter.string(from: self)
    }
}

