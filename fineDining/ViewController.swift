//
//  ViewController.swift
//  fineDining
//
//  Created by Koko Wing on 5/8/19.
//  Copyright © 2019 Koko Wing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

//Collection View https://www.youtube.com/watch?v=-Mgz9ip1RJo 
    
    @IBOutlet weak var collectionView: UICollectionView!

    var scrollingTimer = Timer()

    //images used in collection view
    var dataArray:[String] = ["avocadoToast", "burgerFries", "caeserSalad", "chickenSandwhich", "chickenTortillaSoup", "roastedPotatoes", "salmon", "tacos", "tritip"]
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell

        cell.myImage.image = UIImage(named: dataArray[indexPath.row])

        var rowIndex = indexPath.row
        let numberOfRecords:Int = self.dataArray.count - 1
        if (rowIndex < numberOfRecords) {
            rowIndex = (rowIndex + 1)
        }else {
            rowIndex = 0
        }

    //causes the collection view images to change automatically
        scrollingTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(ViewController.startTimer(theTimer:)), userInfo: rowIndex, repeats: true)

        return cell
    }

    @objc func startTimer(theTimer:Timer) {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {

            self.collectionView.scrollToItem(at: IndexPath(row: theTimer.userInfo! as! Int,section:0), at: .centeredHorizontally, animated: false)
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // code for swiping left and right
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(rightSwipe)
    }
   
}

//used to swipe between view controllers
extension UIViewController {
    @objc func swipeAction(swipe:UISwipeGestureRecognizer) {
//        let myView = String(describing: self)
//        print ("View name: \(myView)")
        // we had been trying to switch view controllers dependent on the direction of the swipe and the current VC the user was on, but couldn't figure it out
        switch swipe.direction.rawValue {
        case (1):
            performSegue(withIdentifier: "goLeft", sender: self)
        case (2):
            performSegue(withIdentifier: "goRight", sender: self)
        default:
            break
        }
    }
}

