//
//  MusicLoadingView.swift
//  swift_ui_demo
//
//  Created by didi on 2025/9/25.
//

import SwiftUI

enum LoadingViewType {
    case music, dots
}

struct LoadingAnimationView: View {
    @State var type: LoadingViewType = .music
    @State private var isAnimation: Bool = false
    var body: some View {
        switch type {
        case .dots:
            fourDotsLoading()
        default:
            musicLoading()
        }
    }
    
    func musicLoading() -> some View {
        HStack(alignment: .center,spacing: 6) {
            ForEach(0..<5){ index in
                Capsule(style: .continuous).fill(Color.green)
                    .frame(width: 10, height: 50)
                    .scaleEffect(isAnimation ? 0.5 : 1.0)
                    .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(Double(index) * 0.1))
            }
        }.onAppear(){
            self.isAnimation.toggle()
        }
    }
    
    // 4个圆点加载
    func fourDotsLoading() -> some View {
        HStack {
            ForEach(0 ..< 4) { index in
                Circle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                    .scaleEffect(isAnimation ? 1.0 : 0.5)
                    .animation(Animation.easeInOut(duration: 0.5)
                        .repeatForever()
                        .delay(Double(index) * 0.2))
            }
        }.onAppear(){
            self.isAnimation.toggle()
        }
    }
}




#Preview {
    LoadingAnimationView()
}
