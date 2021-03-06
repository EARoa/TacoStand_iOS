//
//  TacosTableViewController.swift
//  TacoStand
//
//  Created by Efrain Ayllon on 7/26/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

import UIKit

class TacosTableViewController: UITableViewController {

    var tacos = [Tacos]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(TacosTableViewController.reloadTableData(_:)), name: "reload", object: nil)
        

        loadThe🌮()
        
    }
    private func loadThe🌮() {
        
        let myAPI = "https://taco-stand.herokuapp.com/api/tacos/"
        
        guard let url = NSURL(string: myAPI) else {
            fatalError("Invalid URL")
        }
        
        let session = NSURLSession.sharedSession()
        
        
        session.dataTaskWithURL(url) { (data :NSData?, response :NSURLResponse?, error :NSError?) in
            
            guard let jsonResult = NSString(data: data!, encoding: NSUTF8StringEncoding) else {
                fatalError("Unable to format data")
            }
            
            let tacosDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary

            let dataArray = tacosDictionary["tacos"] as! NSArray;
            
            
            for taco in dataArray {
                let myTaco = Tacos()
                myTaco.name = taco.valueForKey("name") as! String
                
                myTaco.photo_url = taco.valueForKey ("photo_url")as! String
                
                
                myTaco.price = taco.valueForKey("price") as! String
                
                self.tacos.append(myTaco)
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
                print("HAI!")
            })
            
            
            }.resume()
    }
    
    
    func reloadTableData(notification: NSNotification) {
        print("haii")
        loadThe🌮()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tacos.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TacoCell", forIndexPath: indexPath)
        
        let myTaco = self.tacos[indexPath.row]
        cell.textLabel?.text = myTaco.name

        cell.detailTextLabel?.text = myTaco.price

        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) {
            guard let imageURL = NSURL(string: myTaco.photo_url) else {
                fatalError("Invalid URL")
            }
            
            let imageData = NSData(contentsOfURL: imageURL)
            
            let image = UIImage(data: imageData!)
            dispatch_async(dispatch_get_main_queue(), {
            print(myTaco.photo_url)

            cell.imageView?.image = image

        })
        }

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "TacoDetail"){
            let tacoInfoViewController = segue.destinationViewController as! TacoDetailViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow?.row
            
            tacoInfoViewController.allTacos = tacos[indexPath!]
        }
    }



}
