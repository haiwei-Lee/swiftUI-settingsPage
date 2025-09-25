//
//  SettingsSection.swift
//  swift_ui_demo
//
//  Created by didi on 2025/9/24.
//

import SwiftUI

struct SettingsSection<Content: View>: View {
    
    let header: String?
    let footer: String?
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack(alignment: .leading,spacing: 6, content: {
            if let header = header {
                Text(header.uppercased())
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                    .padding(.horizontal)
            }
            VStack(spacing: 0, content: {
                content
            })
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
            
            if let footer = footer{
                Text(footer)
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                    .padding(.horizontal)
            }
        })
    }
}

