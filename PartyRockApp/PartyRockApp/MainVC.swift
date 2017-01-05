//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Shankar Prajapati on 9/25/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRocks]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRocks(imageURL: "https://yt3.ggpht.com/-wSUSoF6s1z4/AAAAAAAAAAI/AAAAAAAAAAA/8YLLTKeWuO0/s100-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/n921ReimU_g\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Yi Aankhama Timi Chheu")
        
        let p2 = PartyRocks(imageURL: "https://yt3.ggpht.com/-GuqdszuYAgA/AAAAAAAAAAI/AAAAAAAAAAA/JOR6mYxQTxY/s100-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/QqWfZseQtoY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Tungnako Dhoon Ma")
        
        let p3 = PartyRocks(imageURL: "https://yt3.ggpht.com/-GuqdszuYAgA/AAAAAAAAAAI/AAAAAAAAAAA/JOR6mYxQTxY/s100-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/OAtFSxU-l4o\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Hasu Kasari/ Roop Tera")
        
        let p4 = PartyRocks(imageURL: "https://yt3.ggpht.com/-A7-KMjMGI78/AAAAAAAAAAI/AAAAAAAAAAA/-3EUvYAl5lQ/s100-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kKpo0v0wIbE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "WHERE MY BAES AT?")
        
        let p5 = PartyRocks(imageURL: "https://yt3.ggpht.com/-xjeq1t5vSyE/AAAAAAAAAAI/AAAAAAAAAAA/kboHvBqgdlo/s100-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/QUZdl282Ts4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Epic CIRCUS STUNTS")
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
       
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRocks: partyRock)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRocks{
                destination.partyRock = party
            }
        }
    }


}

