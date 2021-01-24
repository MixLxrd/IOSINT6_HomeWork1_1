//
//  ProfileViewController.swift
//  IOSINT6_HomeWork1_1
//
//  Created by Михаил Ильченко on 23.01.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Your's Profile"
        view.backgroundColor = .systemGray
        
        setupUI()
        
    }
}

extension ProfileViewController {
    
    private func setupUI() {
        view.addSubview(profileImageView)
        profileImageView.backgroundColor = .blue
        let imageViewConstraints = [
            profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(imageViewConstraints)
    }
    
}
