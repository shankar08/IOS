//
//  customButton.swift
//  subclassing
//
//  Created by Shankar Prajapati on 9/2/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class customButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 10.0
        backgroundColor = UIColor(red: 146.0/255.0, green: 210.0/255.0, blue: 80.0/255.0, alpha: 1.0)
        setTitle("Press me", forState: .Normal)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }

}
