//
//  DetailView.swift
//  Fruits
//
//  Created by Felix Liman on 29/06/21.
//

import UIKit

final class DetailView: UIView {
    
    private let containerView = UIView()
    
    private let backgroundImg = UIImageView()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let backView = UIView()
    private let backImg = UIImageView()
    private let backLbl = UILabel()
    let backBtn = UIButton()
    
    private let titleLbl = UILabel()
    private let fruitImg = UIImageView()
    private let descriptionTitleLbl = UILabel()
    private let descriptionLbl = UILabel()
    
    private let storageTitleLbl = UILabel()
    private let storageLbl = UILabel()
    
    private let preparationTitleLbl = UILabel()
    private let preparationLbl = UILabel()
    
    var model: FruitModel? {
        didSet {
            titleLbl.text = model?.name.uppercased()
            backgroundImg.image = UIImage(named: model?.image ?? "")
            fruitImg.image = UIImage(named: model?.image ?? "")
            descriptionLbl.text = model?.description.uppercased()
            storageLbl.text = model?.storage.uppercased()
            preparationLbl.text = model?.preparation.uppercased()
            if model?.type == 1 {
                titleLbl.snp.updateConstraints { make in
                    make.top.equalTo(contentView).offset(242)
                }
            } else {
                titleLbl.snp.updateConstraints { make in
                    make.top.equalTo(contentView).offset(170)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tone
        
        addSubview(containerView)
        containerView.addSubviews(backgroundImg, scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(backView, titleLbl, fruitImg, descriptionTitleLbl, descriptionLbl, storageTitleLbl, storageLbl, preparationTitleLbl, preparationLbl)
        backView.addSubviews(backImg, backLbl, backBtn)
        
        setupContraints()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        containerView.style {
            $0.clipsToBounds = true
        }
        
        scrollView.style {
            $0.alwaysBounceVertical = true
            $0.clipsToBounds = false
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
        
        titleLbl.style {
            $0.font = .systemFont(ofSize: 40)
            $0.numberOfLines = 0
            $0.textColor = .shade
        }
        
        backgroundImg.style {
            $0.alpha = 0.25
            $0.transform = CGAffineTransform(rotationAngle: -15 * CGFloat.pi / 180)
        }
        
        fruitImg.style {
            $0.transform = CGAffineTransform(rotationAngle: 15 * CGFloat.pi / 180)
        }
        
        descriptionTitleLbl.style {
            $0.font = .systemFont(ofSize: 16)
            $0.numberOfLines = 0
            $0.textColor = .shade
            $0.text = "Description".uppercased()
        }
        
        descriptionLbl.style {
            $0.font = .systemFont(ofSize: 13)
            $0.numberOfLines = 0
            $0.textColor = .shade
        }
        
        storageTitleLbl.style {
            $0.font = .systemFont(ofSize: 16)
            $0.numberOfLines = 0
            $0.textColor = .shade
            $0.text = "How to store".uppercased()
        }
        
        storageLbl.style {
            $0.font = .systemFont(ofSize: 13)
            $0.numberOfLines = 0
            $0.textColor = .shade
        }
        
        preparationTitleLbl.style {
            $0.font = .systemFont(ofSize: 16)
            $0.numberOfLines = 0
            $0.textColor = .shade
            $0.text = "How to prepare".uppercased()
        }
        
        preparationLbl.style {
            $0.font = .systemFont(ofSize: 13)
            $0.numberOfLines = 0
            $0.textColor = .shade
        }
        
    }
    
    private func setupContraints() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.leading.trailing.equalTo(self)
        }
        
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
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(170)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
        backgroundImg.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-50)
            make.leading.equalTo(self).offset(-128)
            make.size.equalTo(500)
        }
        
        fruitImg.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(60)
            make.size.equalTo(278)
        }
        
        descriptionTitleLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(24)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
        descriptionLbl.snp.makeConstraints { make in
            make.top.equalTo(descriptionTitleLbl.snp.bottom).offset(16)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
        storageTitleLbl.snp.makeConstraints { make in
            make.top.equalTo(descriptionLbl.snp.bottom).offset(24)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
        storageLbl.snp.makeConstraints { make in
            make.top.equalTo(storageTitleLbl.snp.bottom).offset(16)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
        preparationTitleLbl.snp.makeConstraints { make in
            make.top.equalTo(storageLbl.snp.bottom).offset(24)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
        preparationLbl.snp.makeConstraints { make in
            make.top.equalTo(preparationTitleLbl.snp.bottom).offset(16)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.bottom.equalTo(contentView).offset(-20)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
}
