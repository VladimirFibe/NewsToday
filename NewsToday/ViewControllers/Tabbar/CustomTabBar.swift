//
//  CustomTabBar.swift
//  NewToday
//
//  Created by Vika on 25.10.24.
//

import UIKit

class CustomTabBar: UITabBar {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addRoundedCornersToTabBar()
    }

    private func addRoundedCornersToTabBar() {
        let radius: CGFloat = 12  // Радиус закругления
        
        let layer = CAShapeLayer()
        let bounds = self.bounds.insetBy(dx: 0, dy: -10)  // Корректировка границ для закругления
        
        let roundedPath = UIBezierPath(roundedRect: bounds,
                                       byRoundingCorners: [.topLeft, .topRight],  // Закруглить только верхние углы
                                       cornerRadii: CGSize(width: radius, height: radius))
        
        layer.path = roundedPath.cgPath
        layer.fillColor = UIColor.white.cgColor  // Цвет фона таббара
        layer.shadowColor = UIColor(red: 0.674, green: 0.688, blue: 0.766, alpha: 0.32).cgColor  // добавление тени
        layer.shadowOffset = CGSize(width: 0, height: -1)  // Настройки тени
        layer.shadowOpacity = 1
        layer.shadowRadius = 0
        
        self.layer.insertSublayer(layer, at: 0)
        self.layer.masksToBounds = false
    }
}
