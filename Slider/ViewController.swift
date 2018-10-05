//
//  ViewController.swift
//  Slider
//
//  Created by Dnyaneshwar Shinde on 04/10/18.
//  Copyright © 2018 Dnyaneshwar Shinde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
       var tap : Int = Int()
    
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var myImagesArray = ["1","2","3","4","1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slideImage.isUserInteractionEnabled = true
        
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = myImagesArray.count
        slideImage.image = UIImage(named: myImagesArray[0])
        tap = 0
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.slideImage.addGestureRecognizer(swipeRight)
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeleft.direction = UISwipeGestureRecognizer.Direction.left
         self.slideImage.addGestureRecognizer(swipeleft)
    }
    @IBAction func PageControllclickAction(_ sender: UIPageControl) {
        print(sender.currentPage)
        let name = self.myImagesArray[sender.currentPage] as String
         self.slideImage.image = UIImage(named: name)
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                tap -= 1
                    UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                        if self.tap > 0 && self.tap < self.myImagesArray.count{
                        let name = self.myImagesArray[self.tap] as String
                        self.slideImage.image = UIImage(named: name)
                        self.pageControl.currentPage = self.tap
                        }else if self.tap == 0{
                            let name = self.myImagesArray[0] as String
                            self.slideImage.image = UIImage(named: name)
                            self.pageControl.currentPage = 0
                        }
                    })
              
            case UISwipeGestureRecognizer.Direction.left:
               tap += 1
                    UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                        if self.tap > 0 && self.tap < self.myImagesArray.count{
                        let name = self.myImagesArray[self.tap-1] as String
                        self.slideImage.image = UIImage(named: name)
                        self.pageControl.currentPage = self.tap
                        }else if self.tap == 0{
                            let name = self.myImagesArray[0] as String
                            self.slideImage.image = UIImage(named: name)
                            self.pageControl.currentPage = 0
                        }
                    })
            default:
                break
            }
        }
    }
}
