//
//  HomeViewController.swift
//  Fruits
//
//  Created by Felix Liman on 28/06/21.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
    
    private lazy var root = HomeView()
    
    private var allFruits: [FruitModel]?
    private var fruits: [FruitModel]?
    
    private var disposable = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        getData()
        setupButton()
        
        root.fruitsCollection.delegate = self
        root.fruitsCollection.dataSource = self
        
        root.searchBar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.setNavigationBarHidden(true, animated: true)
        root.fruitsCollection.automaticallyAdjustsContentSize()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        root.fruitsCollection.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        root.animationView.play()
        showCollection()
    }
    
    private func getData() {
        guard let data = readLocalJSONFile(forName: "fruits") else { return }
        allFruits = parse(jsonData: data)
        fruits = allFruits
    }
    
    private func showCollection() {
        UIView.animate(withDuration: 0.6, delay: 3, animations: {
            self.root.animationView.alpha = 0
            self.root.fruitsCollection.alpha = 1
        }, completion: nil)
    }
    
    private func setupButton() {
        root.profileBtn.rx.tap.bind { _ in
            let profileVC = ProfileViewController()
            self.navigationController?.pushViewController(profileVC, animated: true)
        }.disposed(by: disposable)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruits?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitsCollectionCell.identifier, for: indexPath) as? FruitsCollectionCell else { return UICollectionViewCell() }
        cell.model = fruits?.get(indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitsCollectionCell.identifier, for: indexPath) as? FruitsCollectionCell else { return CGSize() }
        cell.model = fruits?.get(indexPath.item)
        let size = CGSize(width: collectionView.frame.width, height: cell.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController(fruit: fruits?.get(indexPath.item))
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "", searchText.count >= 2 {
            fruits = allFruits?.filter({ fruit in
                fruit.name.uppercased().contains(searchText) || fruit.caption.uppercased().contains(searchText)
            })
        } else {
            fruits = allFruits
        }
        root.fruitsCollection.reloadData()
        root.fruitsCollection.automaticallyAdjustsContentSize()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
