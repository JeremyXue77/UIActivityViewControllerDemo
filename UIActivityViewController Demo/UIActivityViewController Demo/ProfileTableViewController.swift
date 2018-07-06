//
//  ProfileTableViewController.swift
//  UIActivityViewController Demo
//
//  Created by JeremyXue on 2018/7/6.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    @IBOutlet weak var userImage: UIImageView! {
        didSet {
            userImage.layer.cornerRadius = userImage.frame.height / 2
            userImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userBlog: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    @IBAction func shareInfo(_ sender: UIButton) {
        let activityVC = UIActivityViewController(activityItems: [userImage.image!,userName.text!,userBlog.text!], applicationActivities: nil)
        
        activityVC.completionWithItemsHandler = {(activityType: UIActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in

            if error != nil {
                self.showAlert(title: "Error", message: "Error:\(error!.localizedDescription)")
                return
            }
            if completed {
                self.showAlert(title: "Success", message: "Share \(self.userName.text!)'s information.")
            }

        }
            
        self.present(activityVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert(title:String,message:String) {
        let alertController = UIAlertController(title: title, message: message , preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
