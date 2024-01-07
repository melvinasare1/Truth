//
//  BaseCollectionViewFlowLayout.swift
//  Truth
//
//  Created by Melvin Asare on 06/01/2024.
//

import UIKit

class BaseCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        scrollDirection = .vertical // Default scroll direction
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        scrollDirection = .vertical // Default scroll direction
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)?.map { $0.copy() as! UICollectionViewLayoutAttributes }
        
        var sectionAttributes: [Int: UICollectionViewLayoutAttributes] = [:]
        
        for attributes in layoutAttributes ?? [] {
            if attributes.representedElementCategory == .cell {
                sectionAttributes[attributes.indexPath.section] = attributes
            }
        }
        
        for attributes in layoutAttributes ?? [] {
            if attributes.representedElementCategory == .cell {
                if let sectionAttribute = sectionAttributes[attributes.indexPath.section] {
                    if attributes.indexPath.item != 0 {
                        // If not the first cell in the section, align with the previous cell
                        attributes.frame.origin.y = sectionAttribute.frame.origin.y
                    }
                }
            }
        }
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var finalContentOffset = proposedContentOffset
        if let collectionView = collectionView {
            let collectionViewBounds = collectionView.bounds
            let halfWidth = collectionViewBounds.size.width * 0.5
            let proposedContentOffsetCenterX = proposedContentOffset.x + halfWidth
            
            if let attributesForVisibleCells = layoutAttributesForElements(in: collectionViewBounds) {
                var minDistance = CGFloat.greatestFiniteMagnitude
                
                for attributes in attributesForVisibleCells {
                    let centerX = attributes.center.x
                    let distance = abs(centerX - proposedContentOffsetCenterX)
                    
                    if distance < minDistance {
                        minDistance = distance
                    }
                }
                
                finalContentOffset.x += minDistance * velocity.x > 0 ? collectionViewBounds.size.width : -collectionViewBounds.size.width
                finalContentOffset.x = max(0, min(finalContentOffset.x, collectionView.contentSize.width - collectionViewBounds.size.width))
            }
        }
        
        return finalContentOffset
    }
    
    override func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        if context.invalidateDataSourceCounts {
            sectionAttributes = [:]
        }
        super.invalidateLayout(with: context)
    }
    
    private var sectionAttributes: [Int: UICollectionViewLayoutAttributes] = [:]
    
}
