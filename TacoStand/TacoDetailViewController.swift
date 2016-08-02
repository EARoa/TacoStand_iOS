//
//  TacoDetailViewController.swift
//  TacoStand
//
//  Created by Efrain Ayllon on 7/26/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit


class TacoDetailViewController: UIViewController {
    
    
    var allTacos = Tacos()

    @IBOutlet weak var tacoName :UILabel!
    @IBOutlet weak var tacoCost :UILabel!
    @IBOutlet weak var tacosURL :UIImageView!

    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tacoName.text = self.allTacos.name
        self.tacoCost.text = self.allTacos.price
        
        
        let tacosURL = NSURL(string: self.allTacos.photo_url)
        let imageData = NSData(contentsOfURL: tacosURL!)
        let tacoImage = UIImage(data: imageData!)
        
        self.tacosURL.image = tacoImage
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
