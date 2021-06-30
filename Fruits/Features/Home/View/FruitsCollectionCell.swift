//
//  FruitsCollectionCell.swift
//  Fruits
//
//  Created by Felix Liman on 29/06/21.
//

import UIKit

final class FruitsCollectionCell: UICollectionViewCell {
    
    private let fruitImg = UIImageView()
    private let stackView = UIStackView()
    private let nameLbl = UILabel()
    private let captionLbl = UILabel()
    
    var model: FruitModel? {
        didSet {
            fruitImg.image = UIImage(named: model?.image ?? "")
            nameLbl.text = model?.name.uppercased()
            captionLbl.text = model?.caption.uppercased()
        }
    }
    
    static let identifier = "fruitsCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        contentView.addSubviews(fruitImg, stackView)
        stackView.addArrangedSubviews(nameLbl, captionLbl)
        
        setupConstraints()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.style {
            $0.setLayer(cornerRadius: 16)
            $0.backgroundColor = .tint
        }
        
        stackView.style {
            $0.axis = .vertical
            $0.spacing = 8
        }
        
        nameLbl.style {
            $0.textColor = .shade
            $0.font = .systemFont(ofSize: 16)
            $0.numberOfLines = 0
        }
        
        captionLbl.style {
            $0.textColor = .shade
            $0.font = .systemFont(ofSize: 10)
            $0.numberOfLines = 0
        }
        
    }
    
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        fruitImg.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(16)
            make.leading.equalTo(contentView).offset(20)
            make.bottom.equalTo(contentView).offset(-16)
            make.size.equalTo(70)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(fruitImg.snp.trailing).offset(16)
            make.trailing.equalTo(contentView).offset(-16)
            make.centerY.equalTo(fruitImg)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
