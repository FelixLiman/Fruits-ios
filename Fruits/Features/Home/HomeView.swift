//
//  HomeView.swift
//  Fruits
//
//  Created by Felix Liman on 28/06/21.
//

import UIKit
import Lottie

final class HomeView: UIView {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let nameLbl = UILabel()
    private let greetingLbl = UILabel()
    private let profileImg = UIImageView()
    let profileBtn = UIButton()
    
    private let questionLbl = UILabel()
    let searchBar = UISearchBar()
    let fruitsCollection = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
    let animationView = AnimationView(name: "bouncingFruits")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tone
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(nameLbl, profileImg, profileBtn, greetingLbl, questionLbl, searchBar, fruitsCollection, animationView)
        
        setupConstraints()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        nameLbl.style {
            $0.text = "Hello, Felix".uppercased()
            $0.font = .systemFont(ofSize: 40)
            $0.textColor = .shade
        }
        
        greetingLbl.style {
            $0.text = "Good Morning".uppercased()
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = .shade
        }
        
        profileImg.style {
            $0.image = UIImage(named: "profile")
            $0.roundCorner()
        }
        
        questionLbl.style {
            $0.text = "What do you want to explore?".uppercased()
            $0.textColor = .shade
        }
        
        searchBar.style {
            $0.backgroundImage = UIImage()
            $0.searchTextField.backgroundColor = .tint
            $0.searchTextField.font = .systemFont(ofSize: 16)
            $0.searchTextField.tintColor = .shade
            $0.searchTextField.textColor = .shade
            $0.searchTextField.autocapitalizationType = .allCharacters
            $0.enablesReturnKeyAutomatically = false
            $0.placeholder = "Try \"pome\"".uppercased()
        }
        
        fruitsCollection.style {
            $0.alpha = 0
            $0.backgroundColor = .clear
            $0.register(FruitsCollectionCell.self, forCellWithReuseIdentifier: FruitsCollectionCell.identifier)
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 20
            $0.setCollectionViewLayout(layout, animated: true)
            $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        animationView.style {
            $0.alpha = 1
            $0.contentMode = .scaleAspectFit
            $0.loopMode = .loop
            $0.animationSpeed = 1.5
        }
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.width.equalTo(scrollView)
        }
        
        nameLbl.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(30)
            make.leading.equalTo(contentView).offset(20)
        }
        
        greetingLbl.snp.makeConstraints { make in
            make.top.equalTo(nameLbl.snp.bottom)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
        profileImg.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).offset(-20)
            make.centerY.equalTo(nameLbl)
            make.size.equalTo(48)
        }
        
        profileBtn.snp.makeConstraints { make in
            make.edges.size.equalTo(profileImg)
        }
        
        questionLbl.snp.makeConstraints { make in
            make.top.equalTo(greetingLbl.snp.bottom).offset(40)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(questionLbl.snp.bottom).offset(6)
            make.leading.equalTo(contentView).offset(12)
            make.trailing.equalTo(contentView).offset(-12)
        }
        
        fruitsCollection.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(6)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.bottom.equalTo(contentView).offset(-20)
            make.height.equalTo(0).priority(999)
        }
        
        animationView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(54)
            make.centerX.equalTo(contentView)
            make.size.equalTo(200)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
