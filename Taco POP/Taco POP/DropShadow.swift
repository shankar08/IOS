//
//  DropShadow.swift
//  Taco POP
//
//  Created by Shankar Prajapati on 10/15/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

protocol DropShadow {}

extension DropShadow where Self: UIView {
    func addDropShadow() {
        //implementation
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
    }
}
