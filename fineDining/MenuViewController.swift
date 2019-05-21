//
//  MenuViewController.swift
//  fineDining
//
//  Created by Koko Wing on 5/8/19.
//  Copyright © 2019 Koko Wing. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var menuArray:[String] = ["sMenu", "nMenu"]

    @IBOutlet weak var menuImage: UIImageView!

    @IBOutlet weak var toggle: UISwitch!
    
    //changes the menu from s to n using a switch
    
    @IBAction func menuSwitch(_ sender: UISwitch) {
        if toggle.isOn {
            menuImage.image = UIImage(named: "sMenu")
        } else {
            menuImage.image = UIImage(named: "nMenu")
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuImage.image = UIImage(named: "sMenu")
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(rightSwipe)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
