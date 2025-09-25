//
//  SettingRowType.swift
//  swift_ui_demo
//
//  Created by didi on 2025/9/24.
//

import Foundation
import SwiftUI

enum SettingRowType {
    case navigation(action:()->Void)
    case toggle(binding: Binding<Bool>)
    case detail(text: String, action: (() -> Void)? = nil)
    case stepper(value: Binding<Double>, range: ClosedRange<Double>, step: Double = 1.0)
    case picker(selection: Binding<String>, options: [String], action: (() -> Void)? = nil)
    case textField(text: Binding<String>, placeholder: String = "")
    case display(text: String)
    case button(style: ButtonStyle = .normal, action: () -> Void)
    
    enum ButtonStyle {
        case normal, destructive, prominent
    }
}
