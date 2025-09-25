//
//  SettingsView.swift
//  swift_ui_demo
//
//  Created by didi on 2025/9/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var wifiEnabled = true
    @State private var bluetoothEnabled = false
    @State private var brightness: Double = 50
    @State private var deviceName = "我的 iPhone"
    @State private var language = "简体中文"
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView{
                VStack(spacing: 20) {
                    // 显示与亮度
                    SettingsSection(header: "显示与亮度", footer: nil) {
                        SettingsRow(iconType: .screen, title: "亮度", type: .stepper(value: $brightness, range: 0...100, step: 5))
                    }
                    // 连接
                    SettingsSection(header: "连接", footer: nil) {
                        SettingsRow(iconType: .wifi, title: "Wi-Fi", type: .toggle(binding: $wifiEnabled))
                        SettingsRow(iconType: .bluetooth, title: "蓝牙", type: .toggle(binding: $bluetoothEnabled))
                        SettingsRow(iconType: .cellular, title: "蜂窝网络", type: .navigation(action: {
                            print("进入蜂窝网络")
                        }))
                        
                    }
                    
                    // 通用
                    SettingsSection(header: "通用", footer: nil) {
                        SettingsRow(iconType: .general, title: "关于本机", type: .navigation(action: {
                            print("关于本机")
                        }))
                        
                        SettingsRow(iconType: .language, title: "语言与地区", type: .detail(text: language, action: {
                            print("语言与地区")
                        }))
                        SettingsRow(iconType: .keyboard, title: "设备名称", type: .textField(text: $deviceName, placeholder: "输入名称"))
                        
                    }
                    
                    SettingsSection(header: "设备信息", footer: "这些信息用于识别您的设备") {
                        SettingsRow(iconType: .deviceInfo, title: "型号", type: .display(text: "iPhone 15 Pro"))
                        SettingsRow(iconType: .deviceInfo, title: "iOS 版本", type: .display(text: "17.5.1"))
                    }
                    
                    // 重置
                    SettingsSection(header: nil, footer: "重置设置不会删除数据") {
                        
                        SettingsRow(iconType: .resetSettings, title: "重置所有设置", type:.button(style: .destructive, action: {
                            print("重置")
                        }))
                        SettingsRow(iconType: .exportData, title: "导出数据", type:.button(style: .prominent, action: {
                            print("导出")
                        }))
                        
                    }
                    
                }
            }
            .background(Color(.systemGroupedBackground))
            
            LoadingAnimationView(type: .dots)
        }
        
    }
}

#Preview {
    SettingsView()
}
