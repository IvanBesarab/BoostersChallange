//
//  UIView.swift
//  BoostersChallange
//
//  Created by Ivan Besarab on 1/19/20.
//  Copyright © 2020 Ivan Besarab. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
