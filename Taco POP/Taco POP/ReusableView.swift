//
//  ReusableView.swift
//  Taco POP
//
//  Created by Shankar Prajapati on 10/15/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

protocol  ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
