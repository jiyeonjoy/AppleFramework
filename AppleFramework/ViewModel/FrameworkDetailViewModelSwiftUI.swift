//
//  FrameworkDetailViewModelSwiftUI.swift
//  AppleFramework
//
//  Created by 최지연/클라이언트 on 2023/08/22.
//

import Foundation
import SwiftUI

final class FrameworkDetailViewModelSwiftUI: ObservableObject {
    @Published var framework: AppleFramework
    @Published var isSafariPresented: Bool = false
    
    init(framework: AppleFramework) {
        self.framework = framework
    }
}
