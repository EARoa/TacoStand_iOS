//
//  NewTacoViewController.swift
//  TacoStand
//
//  Created by Efrain Ayllon on 7/26/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit

class NewTacoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func closeButtonPressed(){
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    
    @IBAction func addTacoButtonPressed(){
        self.dismissViewControllerAnimated(true, completion: {})
    }
}
