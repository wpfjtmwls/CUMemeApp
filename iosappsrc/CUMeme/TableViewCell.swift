//
//  TableViewCell.swift
//  CUMeme
//
//  Created by 毛悦 on 5/5/18.
//  Copyright © 2018 Yue mao. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
