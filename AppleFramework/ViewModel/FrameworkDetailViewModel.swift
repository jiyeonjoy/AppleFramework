//
//  FrameworkDetailViewModel.swift
//  AppleFramework
//
//  Created by 최지연/클라이언트 on 2023/08/16.
//

import Foundation
import Combine

final class FrameworkDetailViewModel {
    
    init(framework: AppleFramework) {
        self.framework = CurrentValueSubject(framework)
    }
    
    // Data => Output
    let framework: CurrentValueSubject<AppleFramework, Never>
    
    // User Action => Input
    let buttonTapped = PassthroughSubject<String, Never>()
    func learnMoreTapped() {
        buttonTapped.send(framework.value.urlString)
    }
}
