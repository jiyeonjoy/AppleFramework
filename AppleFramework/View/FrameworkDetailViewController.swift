//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by 최지연/클라이언트 on 2023/08/02.
//

import UIKit
import SafariServices
import Combine

class FrameworkDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Combine
    var subscriptions = Set<AnyCancellable>()
    var viewModel: FrameworkDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        viewModel?.framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.updateUI(framework)
        }.store(in: &subscriptions)
        
        viewModel?.buttonTapped
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0) }
            .sink { [unowned self] url in
                let safari = SFSafariViewController(url: url)
                self.present(safari, animated: true)
        }.store(in: &subscriptions)
    }
    
    func updateUI(_ framework: AppleFramework) {
        imageView.image = UIImage(named: framework.imageName)
        titleLabel.text = framework.name
        descriptionLabel.text = framework.description
    }
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        viewModel?.learnMoreTapped()
    }
}
