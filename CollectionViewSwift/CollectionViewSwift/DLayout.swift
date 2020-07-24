//
//  DLayout.swift
//  CollectionViewSwift
//
//  Created by 邓乐 on 2020/7/24.
//  Copyright © 2020 lele. All rights reserved.
//

import UIKit

class DLayout: UICollectionViewLayout {

    override func prepare() {
        super.prepare()
        print("prepare")
    }
    
    override func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        super.invalidateLayout(with: context)
        print("context:\(context)")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attr = super.layoutAttributesForElements(in: rect)
        return attr
    }
}
