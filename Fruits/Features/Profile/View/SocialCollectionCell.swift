//
//  SocialCollectionCell.swift
//  Fruits
//
//  Created by Felix Liman on 30/06/21.
//

import UIKit

final class SocialCollectionCell: UICollectionViewCell {
    
    let socialImg = UIImageView()
    let nameLbl = UILabel()
    
    var model: SocialModel? {
        didSet {
            socialImg.image = UIImage(named: model?.image ?? "")?.withRenderingMode(.alwaysTemplate)
            socialImg.tintColor = .shade
            nameLbl.text = model?.name.uppercased()
        }
    }
    
    static let identifier = "fruitsCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        contentView.addSubviews(socialImg, nameLbl)
        
        setupConstraints()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.style {
            $0.setLayer(cornerRadius: 8)
            $0.backgroundColor = .tint
        }
        
        socialImg.style {
            $0.image = UIImage(named: "pineapple")
        }
        
        nameLbl.style {
            $0.textColor = .shade
            $0.font = .systemFont(ofSize: 16)
            $0.numberOfLines = 0
            $0.text = "GitHub".uppercased()
        }
    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        socialImg.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(16)
            make.leading.equalTo(contentView).offset(24)
            make.bottom.equalTo(contentView).offset(-16)
            make.size.equalTo(14)
        }
        
        nameLbl.snp.makeConstraints { make in
            make.center.equalTo(contentView)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
