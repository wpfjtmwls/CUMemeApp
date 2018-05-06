//
//  collectionViewCell.swift
//  CUMeme
//
//  Created by 毛悦 on 4/28/18.
//  Copyright © 2018 Yue mao. All rights reserved.
//

import UIKit

//Creating a super simple collectionViewCell

class collectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var academicCategory: AcademicCategories!
    
    
//    var numberLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Update constraints as normal
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            ])


        super.updateConstraints()
    }
}
