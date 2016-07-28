//
//  TacoDetailViewController.swift
//  TacoStand
//
//  Created by Efrain Ayllon on 7/26/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit

class TacoDetailViewController: UIViewController {
    
    var passedName:String!
    var passedCost:String!
    var passedImageURL:UIImage!

    @IBOutlet weak var tacoName :UILabel!
    @IBOutlet weak var tacoCost :UILabel!
    @IBOutlet weak var tacoImage :UIImageView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Name:\(passedName), Cost:\(passedCost)")

        // Do any additional setup after loading the view.
        
        
        tacoName.text = passedName
        tacoCost.text = passedCost
        tacoImage.image = passedImageURL
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
