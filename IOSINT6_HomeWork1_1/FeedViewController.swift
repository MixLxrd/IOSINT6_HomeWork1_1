//
//  FeedViewController.swift
//  IOSINT6_HomeWork1_1
//
//  Created by Михаил Ильченко on 23.01.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    
    var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
        
        print("Background time remaining = \(UIApplication.shared.backgroundTimeRemaining) seconds")
    }
    
    private lazy var postsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PostCollectionViewCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.fire()
        self.navigationItem.title = "Feed's"
        view.backgroundColor = .systemGray
        
        setupUI()
    }
    
}

extension FeedViewController {
    
    private func setupUI() {
        view.addSubview(postsCollectionView)
        
        let constraintsCollectionView = [
            postsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraintsCollectionView)
    }
}

extension FeedViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PostCollectionViewCell.self), for: indexPath) as! PostCollectionViewCell
        cell.backgroundColor = .white
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = PostViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        
        //present(vc, animated: true, completion: nil) //present modally
    }
    
}
