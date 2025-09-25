//
//  SettingsRow.swift
//  swift_ui_demo
//
//  Created by didi on 2025/9/24.
//

import SwiftUI

struct SettingsRow: View {
    let iconType: SettingIconType
    let title: String
    let type: SettingRowType
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: iconType.icon).foregroundColor(iconType.color).frame(width: 25, height: 25)
            //                .overlay {
            //                RoundedRectangle(cornerRadius: 6).stroke(Color(.systemGray5), lineWidth: 1)
            //            }
            Text(title).font(.system(size: 17))
            Spacer()
            rightContent
        }.padding(.horizontal, 16)
            .frame(minHeight: 60)
            .background(Color(.secondarySystemBackground))
            .contentShape(Rectangle())
            .onTapGesture {
                handleTap()
            }
    }
    func handleTap(){
        switch type {
        case .navigation(let action):
            action()
        case .detail(_, let action):
            action?()
        case .button(_, let action):
            action()
        default:
            return
        }
    }
}


extension SettingsRow {
    private var rightContent: AnyView {
        switch type {
        case .navigation(let action):
            AnyView(navigationRightContent(action: action))
        case .toggle(let binding):
            AnyView(toggleRightContent(binding: binding))
        case .detail(let text, let action):
            AnyView(detailRightContent(text: text, action: action))
        case .stepper(value: let value, range: let range, step: let step):
            AnyView(stepperRightContent(value: value, range: range, step: step))
        case .picker(selection: let selection, options: let options, action: let action):
            AnyView(pickerRightContent(selection: selection))
        case .textField(text: let text, placeholder: let placeholder):
            AnyView(textFieldRightContent(text: text, placeholder: placeholder))
        case .display(text: let text):
            AnyView(displayRightContent(text: text))
        case .button(style: let style, action: let action):
            AnyView(buttonRightContent(style: style, action))
        }
    }
    
    private func navigationRightContent(action: @escaping () -> Void) -> some View{
        Image(systemName: "chevron.right")
            .foregroundColor(.secondary) // 系统灰色，符合设置页风格
            .font(.subheadline) // 图标大小适配行高
    }
    private func toggleRightContent(binding: Binding<Bool>) -> some View {
        Toggle("", isOn: binding)
            .labelsHidden() // 隐藏默认标签（标题已在左侧显示）
            .toggleStyle(SwitchToggleStyle(tint: .accentColor)) // 使用系统强调色
    }
    private func detailRightContent(text: String,
                                    action: (() -> Void)? = nil
    ) -> some View {
        HStack(spacing: 4) { // 文本与图标水平排列
            Text(text)
                .font(.subheadline) // 小号文本，区分主标题
                .foregroundColor(.secondary) // 次要文本颜色
            if action != nil { // 有点击事件时显示箭头
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
    private func stepperRightContent(
        value: Binding<Double>,
        range: ClosedRange<Double>,
        step: Double
    ) -> some View {
        Stepper(
            value: value,
            in: range,
            step: step
        ) {
            EmptyView() // 隐藏默认标签（标题已在左侧显示）
        }
        .frame(width: 100) // 限制宽度，避免挤压左侧标题
    }
    
    private func pickerRightContent(selection: Binding<String>) -> some View {
        HStack(spacing: 4) {
            Text(selection.wrappedValue) // 显示当前选中值
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Image(systemName: "chevron.right") // 箭头表示可选择
                .foregroundColor(.secondary)
                .font(.subheadline)
        }
    }
    private func textFieldRightContent(text: Binding<String>,
                                       placeholder: String
    ) -> some View {
        TextField(placeholder, text: text)
        // 无边框样式，融入行内
            .foregroundColor(.primary) // 输入文本为默认黑色/白色（跟随系统主题）
            .frame(maxWidth: 150) // 限制最大宽度，避免挤压左侧标题
            .multilineTextAlignment(.trailing) // 文本右对齐
    }
    
    private func displayRightContent(text: String) -> some View {
        Text(text)
            .font(.subheadline)
            .foregroundColor(.secondary) // 次要文本颜色，区分主标题
    }
    
    private func buttonRightContent(style: SettingRowType.ButtonStyle,
                                    _: (() -> Void)? = nil
    ) -> some View {
        Button(action: {}) { // 点击事件在handleTap中统一处理（见下文）
            Image(systemName: buttonIcon(for: style))
                .foregroundColor(buttonColor(for: style))
        }
        .buttonStyle(.plain) // 去除默认按钮背景，仅保留图标/文本
    }
    
    // 根据按钮样式返回对应图标
    private func buttonIcon(for style: SettingRowType.ButtonStyle) -> String {
        switch style {
        case .normal: "pencil" // 普通样式：编辑图标
        case .destructive: "trash" // 危险样式：删除图标
        case .prominent: "checkmark.circle" // 强调样式：确认图标
        }
    }
    
    // 根据按钮样式返回对应颜色
    private func buttonColor(for style: SettingRowType.ButtonStyle) -> Color {
        switch style {
        case .normal: .accentColor // 系统强调色（如蓝色）
        case .destructive: .red // 危险操作：红色
        case .prominent: .blue // 强调操作：深蓝色
        }
    }
}

