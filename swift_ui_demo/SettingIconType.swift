//
//  SettingIconType.swift
//  swift_ui_demo
//
//  Created by didi on 2025/9/24.
//

import Foundation
import SwiftUICore

enum SettingIconType {
    case general, notifications, privacy, screen, battery, wifi, bluetooth, cellular
    case language, keyboard, accessibility, storage, camera, phontos
    case appstore, safari, mail, messages, facetime, music
    case resetSettings, exportData, deviceInfo
    
    var icon: String{
        switch self {
        case .general:
            return "gear"
        case .notifications:
            return "bell.badge"
        case .privacy:
            return "lock.circle.dotted"
        case .wifi:
            return "wifi"
        case .battery:
            return "battery.100"
        case .cellular:
            return "antenna.radiowaves.left.and.right"
        case .language:
            return "globe"
        case .keyboard:
            return "keyboard"
        case .accessibility:
            return "accessibility"
        case .storage:
            return "camera"
        case .phontos:
            return "photo"
        case .safari:
            return "safari"
        case .mail:
            return "mail"
        case .messages:
            return "message"
        case .facetime:
            return "video"
        case .music:
            return "music.note"
        case .exportData:
            return "square.and.arrow.up"
        case .screen:
            return "sun.righthalf.filled"
        case .resetSettings:
            return "arrow.trianglehead.counterclockwise"
        default:
            return "gear"
        }
    }
    
    var color: Color{
        switch self {
        case .wifi,.cellular,
        .screen:
            return .blue
        case .battery:
            return .green
        case .resetSettings:
            return .red
        default:
            return .gray
        }
    }
}
