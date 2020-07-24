//
//  DFlowLayout.swift
//  CollectionViewSwift
//
//  Created by 邓乐 on 2020/7/24.
//  Copyright © 2020 lele. All rights reserved.
//

import UIKit

class DFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        print("prepareLayout")
    }
    
    override func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        super.invalidateLayout(with: context)
        print("invalidateLayout")
    }
    
    override func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem]) {
        super.prepare(forCollectionViewUpdates: updateItems)
        print("CollectionViewUpdateItem:\(updateItems)")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        print("layoutAttributesForElements")
        let attrs = super.layoutAttributesForElements(in: rect)
        
        let sectionCount = collectionView?.numberOfSections
        let delegateCount = collectionView?.dataSource?.numberOfSections?(in: collectionView!)
        
        print("sectionCount:\(String(describing: sectionCount)),delegateCount:\(String(describing: delegateCount))")
        if let attrs = attrs {
            for attr in attrs {
                print("attr:\(attr.indexPath)")
            }
        }
        
        return attrs
    }
    
}
