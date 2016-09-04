 //
//  MaterialView.swift
//  EverestFC
//
//  Created by Shankar Prajapati on 9/3/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class MaterialView: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 5.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0  
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }

}
