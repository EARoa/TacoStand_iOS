//
//  NewTacoViewController.swift
//  TacoStand
//
//  Created by Efrain Ayllon on 7/26/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit

class NewTacoViewController: UIViewController {

    @IBOutlet weak var tacoName :UITextField!
    @IBOutlet weak var tacoPrice :UITextField!
    @IBOutlet weak var tacoPhotoURL :UITextField!

    
    
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
        
        
        
        let url = "https://taco-stand.herokuapp.com/api/tacos/"
        
        guard let apiURL = NSURL(string: url) else {
            fatalError("URL incorrect")
        }
        
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: apiURL)
        request.HTTPMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        print(request)
        
        let parameters = [
            "taco"  : [
                "name" : "\(tacoName.text)",
                "price" : "\(tacoPrice.text)",
                "photo_url" : "\(tacoPhotoURL.text)",
                ]
        ]
        
        
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
        
        session.dataTaskWithRequest(request) { (data :NSData?, response :NSURLResponse?, error: NSError?) in
            
            
            print("finished")
            
            }.resume()
        
        
        self.dismissViewControllerAnimated(true, completion: {})

    }
}
