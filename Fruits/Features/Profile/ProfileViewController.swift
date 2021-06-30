//
//  ProfileViewController.swift
//  Fruits
//
//  Created by Felix Liman on 29/06/21.
//

import UIKit
import RxCocoa
import RxSwift

final class ProfileViewController: UIViewController {
    
    lazy var root = ProfileView()
    
    var socials: [SocialModel]?
    
    var disposable = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        getData()
        setupButton()
        
        root.socialCollection.delegate = self
        root.socialCollection.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.setNavigationBarHidden(true, animated: true)
        root.socialCollection.automaticallyAdjustsContentSize()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        root.socialCollection.reloadData()
    }
    
    private func getData() {
        guard let data = readLocalJSONFile(forName: "socials") else { return }
        socials = parse(jsonData: data)
    }

    private func setupButton() {
        root.backBtn.rx.tap.bind { _ in
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposable)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socials?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialCollectionCell.identifier, for: indexPath) as? SocialCollectionCell else { return UICollectionViewCell() }
        cell.model = socials?.get(indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialCollectionCell.identifier, for: indexPath) as? SocialCollectionCell else { return CGSize() }
        let size = CGSize(width: collectionView.frame.width, height: cell.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let link = URL(string: socials?.get(indexPath.item)?.link ?? "") else { return }
        UIApplication.shared.open(link)
    }
}
