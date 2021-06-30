//
//  ProfileView.swift
//  Fruits
//
//  Created by Felix Liman on 29/06/21.
//

import UIKit

final class ProfileView: UIView {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let backView = UIView()
    private let backImg = UIImageView()
    private let backLbl = UILabel()
    let backBtn = UIButton()
    
    private let profileImg = UIImageView()
    
    private let nameView = UIView()
    private let nameLbl = UILabel()
    
    let socialCollection = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
    
    private let dataProvidedLbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tone
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(backView, profileImg, nameView, socialCollection, dataProvidedLbl)
        nameView.addSubviews(nameLbl)
        backView.addSubviews(backImg, backLbl, backBtn)
        
        setupConstraints()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        scrollView.style {
            $0.alwaysBounceVertical = true
        }
        
        backImg.style {
            $0.image = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
            $0.tintColor = .shade
        }
        
        backLbl.style {
            $0.font = .systemFont(ofSize: 16)
            $0.numberOfLines = 0
            $0.textColor = .shade
            $0.text = "back".uppercased()
        }
        
        profileImg.style {
            $0.image = UIImage(named: "profile")
            $0.roundCorner()
        }
        
        nameLbl.style {
            $0.font = .systemFont(ofSize: 40)
            $0.textAlignment = .left
            $0.numberOfLines = 0
            $0.textColor = .shade
            $0.text = "felix\n  liman".uppercased()
        }
        
        socialCollection.style {
            $0.backgroundColor = .clear
            $0.register(SocialCollectionCell.self, forCellWithReuseIdentifier: SocialCollectionCell.identifier)
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 20
            $0.setCollectionViewLayout(layout, animated: true)
            $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        dataProvidedLbl.style {
            $0.font = .systemFont(ofSize: 13)
            $0.textAlignment = .center
            $0.numberOfLines = 0
            $0.textColor = .shade
            $0.text = "data provided by\n\nfruitsandveggies.org\nhalfyourplate.ca".uppercased()
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
        
        backView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.top.equalTo(contentView).offset(5)
        }
        
        backImg.snp.makeConstraints { make in
            make.centerY.equalTo(backLbl)
            make.leading.equalTo(backView)
        }
        
        backLbl.snp.makeConstraints { make in
            make.leading.equalTo(backImg.snp.trailing).offset(5)
            make.top.trailing.bottom.equalTo(backView)
        }
        
        backBtn.snp.makeConstraints { make in
            make.edges.equalTo(backView)
        }
        
        profileImg.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.bottom).offset(24)
            make.leading.equalTo(contentView).offset(20)
            make.size.equalTo(128)
        }
        
        nameView.snp.makeConstraints { make in
            make.leading.equalTo(profileImg.snp.trailing).offset(16)
            make.trailing.equalTo(contentView).offset(-20)
            make.centerY.equalTo(profileImg)
        }
        
        nameLbl.snp.makeConstraints { make in
            make.top.bottom.equalTo(nameView)
            make.centerX.equalTo(nameView)
        }
        
        socialCollection.snp.makeConstraints { make in
            make.top.equalTo(profileImg.snp.bottom).offset(24)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.height.equalTo(0).priority(999)
        }
        
        dataProvidedLbl.snp.makeConstraints { make in
            make.top.equalTo(socialCollection.snp.bottom).offset(120)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.bottom.equalTo(contentView).offset(-20)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
