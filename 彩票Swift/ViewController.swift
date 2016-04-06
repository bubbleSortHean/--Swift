//
//  ViewController.swift
//  彩票Swift
//
//  Created by Andy.He on 16/3/29.
//  Copyright © 2016年 Andy.He. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var numRed : Int = 0;
        var someInts = [Int]()
        var numIndex : Int = 0;
        while (true) {
            numRed = Int(arc4random_uniform(33)) + 1;
            if someInts.contains(numRed) {
                continue
            }else{
            someInts.insert(numRed, atIndex: numIndex);
                
            }
            if someInts.count == 6 {
                break
            }
            numIndex += 1;
        }
        
        someInts.sortInPlace { (a : Int, b : Int) -> Bool in
            return a < b
        }
        
        for str : Int in someInts {
            print(str);
        }
        
        var numLabelCount : Int = 0
        while numLabelCount < 6 {
            let label = UILabel(frame: CGRect.init(x: view.frame.width / 7 * CGFloat(numLabelCount), y: 100, width:  view.frame.width / 7, height:  view.frame.width / 7))
            label.layer.masksToBounds = true
            label.layer.cornerRadius = view.frame.width / 7 / 2
            label.backgroundColor = UIColor.redColor()
            label.text = String(someInts[numLabelCount])
            view.addSubview(label)
            numLabelCount += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

