//
//  CustomCell.swift
//  65AppsTest
//
//  Created by Дмитрий Папушин on 21.01.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let reuseID = "FavoriteCell"
    
//    private let placeHolderImage: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.backgroundColor = .systemBackground
//        iv.layer.cornerRadius = 10
//        iv.clipsToBounds = true
//        return iv
//    }()
    
    let placeHolderImage = CustomImageView()
    
    func setImage(url: String) {
        placeHolderImage.loadImage(with: url)
        placeHolderImage.contentMode = .scaleAspectFill
        placeHolderImage.backgroundColor = .systemBackground
        placeHolderImage.layer.cornerRadius = 10
        placeHolderImage.clipsToBounds = true
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        configureUI()
    }
    
    private func configureUI() {
        addSubview(placeHolderImage)
        placeHolderImage.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0), size: .init(width: 60, height: 60))
        placeHolderImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
