//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Shankar Prajapati on 7/27/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //1 = noughts, 2 = crosses
    
    var activePlayer = 1
    
    var gameActive = true
    
    //this array will help us to keep track of the board state, 0 means empty
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    //winning state
    var winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var playAgain: UIButton!
    
    @IBAction func playAgainPressed(_ sender: AnyObject) {
        
        activePlayer = 1
        gameActive = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        var button: UIButton
        
        for i in 0 ..< 9  {
        
        button = view.viewWithTag(i) as! UIButton
        button.setImage(nil, for: .normal)
            
        }
        
        gameOverLabel.isHidden = true
        playAgain.isHidden = true
        
        gameOverLabel.center = CGPoint.init(x: gameOverLabel.center.x - 400, y: gameOverLabel.center.y)
        playAgain.center = CGPoint.init(x: playAgain.center.x - 400, y: playAgain.center.y)
        
    }
    
    

    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        //this if statement checks if the state of the box is empty.
        if gameState[sender.tag] == 0  && gameActive == true{
            
            var image = UIImage()
            
            //this keeps tracks of the board location
            gameState[sender.tag] = activePlayer
            
             //altering nought and crosses based on active player
            if activePlayer == 1 {
                
                image = UIImage(named: "cross.png")!
                activePlayer = 2
            }else{
                
                image = UIImage(named: "nought.png")!
                activePlayer = 1
            }
            
            sender.setImage(image, for: .normal)
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    
                    var labelText = "\(first) has Won!"
                
                    if gameState[combination[0]] == 2{
                        labelText = "\(second) has  won!"
                    }
                    
                    gameOverLabel.text = labelText
                    
                    gameOverLabel.isHidden = false
                    playAgain.isHidden = false
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        self.gameOverLabel.center = CGPoint.init(x: self.gameOverLabel.center.x + 400, y: self.gameOverLabel.center.y)
                        self.playAgain.center = CGPoint.init(x: self.playAgain.center.x + 400, y: self.playAgain.center.y)
                    })
                    
                    gameActive = false
                }
            }
        }
       
    }
    @IBAction func QuitPlaying(_ sender: AnyObject) {
        exit(0)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.isHidden = true
        playAgain.isHidden = true
    
        gameOverLabel.center = CGPoint.init(x: gameOverLabel.center.x - 400, y: gameOverLabel.center.y)
        playAgain.center = CGPoint.init(x: playAgain.center.x - 400, y: playAgain.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
    
    }


}

