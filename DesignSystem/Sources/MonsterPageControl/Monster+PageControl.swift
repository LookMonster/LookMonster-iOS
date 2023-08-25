//
//  MonsterPageControl.swift
//  DesignSystem
//
//  Created by 박준하 on 2023/08/25.
//

import Foundation
import UIKit

open class MonsterPageControl: UIPageControl {
    
    var dotSize: CGSize = CGSize(width: 8, height: 8)
    let spacing: CGFloat = 8.0
    
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
}
