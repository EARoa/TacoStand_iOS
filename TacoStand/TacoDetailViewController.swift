//
//  TacoDetailViewController.swift
//  TacoStand
//
//  Created by Efrain Ayllon on 7/26/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit

class TacoDetailViewController: UIViewController {
    
    
    @IBOutlet weak var tacoName :UILabel!
    @IBOutlet weak var tacoCost :UILabel!
    @IBOutlet weak var tacoImage :UIImageView!

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
