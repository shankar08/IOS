//
//  PartyCellTableViewCell.swift
//  PartyRockApp
//
//  Created by Shankar Prajapati on 9/26/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet var videoPreviewImg: UIImageView!
   
    @IBOutlet var videoTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(partyRocks: PartyRocks){
        videoTitle.text = partyRocks.videoTitle
        
        let url = URL(string: partyRocks.imageURL)!
        //this gives a block
        //async is background thread
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                //sync is main thread 
                DispatchQueue.global().sync {
                    self.videoPreviewImg.image = UIImage(data: data)
                }
            }catch {
                //handle the error
            }
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
