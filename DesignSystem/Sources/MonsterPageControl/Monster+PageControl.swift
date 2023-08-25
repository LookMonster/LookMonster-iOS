//
//  MonsterPageControl.swift
//  DesignSystem
//
//  Created by 박준하 on 2023/08/25.
//

import Foundation
import UIKit
import ResourceKit

open class MonsterPageControl: UIPageControl {
    
    var dotSize: CGSize = CGSize(width: 8, height: 8)
    let spacing: CGFloat = 8.0
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        let totalWidthIncludingSpacing = CGFloat(self.subviews.count - 1) * spacing
        
        for (pageIndex, dotView) in self.subviews.enumerated() {
            if currentPage == pageIndex {
                dotView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            } else {
                dotView.frame.size = self.dotSize
            }
            
            let xPosition = ((self.frame.width - totalWidthIncludingSpacing) / CGFloat(self.subviews.count)) * CGFloat(pageIndex)
            
            let yPosition = (self.frame.height - self.dotSize.height) / 2
            
            dotView.frame.origin = CGPoint(x: xPosition, y: yPosition)

            
            dotView.layer.cornerRadius = self.dotSize.height / 2
            dotView.layer.masksToBounds = true
        }
    }
    
    public func configurePageControl() {
        self.pageIndicatorTintColor = ResourceKitAsset.gray200.color
        self.currentPageIndicatorTintColor = UIColor.black
    }
}
