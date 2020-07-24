//
//  DCollectionViewCell.swift
//  CollectionViewSwift
//
//  Created by 邓乐 on 2020/7/24.
//  Copyright © 2020 lele. All rights reserved.
//

import UIKit

class DCollectionViewCell: UICollectionViewCell {
    
    var title = UILabel(frame: CGRect.zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        let titleCon = [title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                        title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)]
        NSLayoutConstraint.activate(titleCon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
