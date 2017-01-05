//
//  NibLoadableView.swift
//  Taco POP
//
//  Created by Shankar Prajapati on 10/15/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

protocol  NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
