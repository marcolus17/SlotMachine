//
//  ViewController.swift
//  SlotMachine
//
//  Created by Nicholas Markworth on 4/20/15.
//  Copyright (c) 2015 Nick Markworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    let kMarginForView: CGFloat = 10.0 // k stands for "constant", used often in Swift
    let kSixth: CGFloat = 1.0 / 6.0 // CGFloat is either a float or a double (32-bit vs 64-bit)
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    let kThird: CGFloat = 1.0 / 3.0
    let kMarginForSlot: CGFloat = 2.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupContainerViews()
        self.setupFirstContainer(self.firstContainer)
        self.setupSecondContainer(self.secondContainer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Setup all the containers
    func setupContainerViews() {
        self.firstContainer = UIView(frame: CGRect(
            x: self.view.bounds.origin.x + kMarginForView, // left border of 10
            y: self.view.bounds.origin.y,
            width: self.view.bounds.width - (kMarginForView * 2), // yieds right border of 10
            height: self.view.bounds.height * kSixth)) // height = 1/6 of the view's height
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer) // add a subview to the main view
        
        self.secondContainer = UIView(frame: CGRect(
            x: self.view.bounds.origin.x + kMarginForView,
            y: firstContainer.frame.height, // attach to the bottom of the first container
            width: self.view.bounds.width - (kMarginForView * 2),
            height: self.view.bounds.height * (3 * kSixth))) // height = 1/2 of the view's height
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect(
            x: self.view.bounds.origin.x + kMarginForView,
            y: firstContainer.frame.height + secondContainer.frame.height,
            width: self.view.bounds.width - (kMarginForView * 2),
            height: self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRect(
            x: self.view.bounds.origin.x + kMarginForView,
            y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height,
            width: self.view.bounds.width - (kMarginForView * 2),
            height: self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.fourthContainer)
    }
    
    // Add a title to the first container
    func setupFirstContainer(containerView: UIView) {
        var titleLabel = UILabel()
        titleLabel.text = "Super Slots"
        titleLabel.textColor = UIColor.yellowColor()
        titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        titleLabel.sizeToFit()
        titleLabel.center = CGPointMake(containerView.frame.width / 2, containerView.frame.height / 2)
        containerView.addSubview(titleLabel)
    }
    
    // Add slot machine containers to the second container
    func setupSecondContainer(containerView: UIView) {
        for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
            for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
                var slotImageView = UIImageView()
                slotImageView.backgroundColor = UIColor.yellowColor()
                slotImageView.frame = CGRect(
                    x: containerView.bounds.origin.x + kMarginForSlot + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird),
                    y: containerView.bounds.origin.y + kMarginForSlot + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird),
                    width: containerView.bounds.width * kThird - (kMarginForSlot * 2),
                    height: containerView.bounds.height * kThird - (kMarginForSlot * 2))
                var quardinateLabel = UILabel()
                quardinateLabel.text = "(\(slotNumber),\(containerNumber))"
                quardinateLabel.textColor = UIColor.blackColor()
                quardinateLabel.sizeToFit()
                quardinateLabel.center = CGPointMake(slotImageView.frame.width / 2, slotImageView.frame.height / 2)
                slotImageView.addSubview(quardinateLabel)
                containerView.addSubview(slotImageView)
            }
        }
    }
    
}

