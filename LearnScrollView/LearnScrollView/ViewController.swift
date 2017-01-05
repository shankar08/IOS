//
//  ViewController.swift
//  LearnScrollView
//
//  Created by Shankar Prajapati on 9/24/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var scrollView: UIScrollView!
    var images = [UIImageView]()
    
    @IBOutlet var myScroll: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myScroll.isUserInteractionEnabled = true
        let swipeRight = UISwipeGestureRecognizer()
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        myScroll?.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer()
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        myScroll?.addGestureRecognizer(swipeLeft)
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
       
        
        
        var contentWidth: CGFloat = 0.0
        
        let scrollWidth = scrollView.frame.size.width
        
    
        
        for x in 0...2 {
            
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75 , width: 150, height: 150)
            
            
        }
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

