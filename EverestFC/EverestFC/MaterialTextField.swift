//
//  MaterialTextField.swift
//  EverestFC
//
//  Created by Shankar Prajapati on 9/3/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class MaterialTextField: UITextField {
 

    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.1).CGColor
        layer.borderWidth = 1.0
        
        
    }
    //for placeholder
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
    }
    
    //while editing the text field (editable text field)
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
    }
}
