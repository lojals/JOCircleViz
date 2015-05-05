//
//  CircleVizz.swift
//  CircleViz
//
//  Created by Jorge Raul Ovalle Zuleta on 5/5/15.
//  Copyright (c) 2015 Jorge R Ovalle Z. All rights reserved.
//

import UIKit

class CircleVizz: UIView {
    var btn1:UIButton!
    var btn2:UIButton!
    var btn3:UIButton!
    var btn4:UIButton!
    
    var tapGesture:UITapGestureRecognizer!
    var multi:CGFloat!
    
    
    override func awakeFromNib() {
        //self.backgroundColor = UIColor.grayColor()
        
        btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        btn1.layer.cornerRadius = btn1.frame.width/2
        btn1.backgroundColor = UIColor.orangeColor()
        btn1.addTarget(self, action: Selector("animate:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btn1)
        
        btn2 = UIButton(frame: CGRect(x: 50, y: 120, width: 16, height: 16))
        btn2.layer.cornerRadius = btn2.frame.width/2
        btn2.backgroundColor = UIColor.greenColor()
        btn2.addTarget(self, action: Selector("animate:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btn2)
        
        btn3 = UIButton(frame: CGRect(x: 150, y: 300, width: 70, height: 70))
        btn3.layer.cornerRadius = btn3.frame.width/2
        btn3.backgroundColor = UIColor.blueColor()
        btn3.addTarget(self, action: Selector("animate:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btn3)

        btn4 = UIButton(frame: CGRect(x: 100, y: 300, width: 32, height: 32))
        btn4.layer.cornerRadius = btn4.frame.width/2
        btn4.backgroundColor = UIColor.redColor()
        btn4.center = btn3.center
        btn4.addTarget(self, action: Selector("animate:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btn4)
        
        tapGesture = UITapGestureRecognizer(target: self, action: Selector("animate2:"))
        addGestureRecognizer(tapGesture)
    }

    func animate(sender:UIView){
        var centerBtn1 = sender.center
        var sizeBtn1 = sender.frame
        var centerTotal = self.center
        var sizeTotal = frame.size
        
        multi = frame.width/sender.frame.width
        
        /*var pop = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        print(frame.width/btn1.frame.width)
        pop.toValue = NSValue(CGSize: CGSizeMake(multi,multi))
        layer.pop_addAnimation(pop, forKey: "abc")
        println((multi)*btn1.frame.width)*/
        
        var pop = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        print(frame.width/btn1.frame.width)
        pop.toValue = NSValue(CGSize: CGSizeMake(multi,multi))
        pop_addAnimation(pop, forKey: "abc")
        
        
        var pop2 = POPSpringAnimation(propertyNamed: kPOPViewCenter)
        pop2.toValue = NSValue(CGPoint: CGPointMake(((((center.x - sender.center.x)*multi)+160)), (((center.y - sender.center.y)*multi)+160)))
        pop_addAnimation(pop2, forKey: "abc2")
    }
    
    func animate2(sender:UIView){
        var pop = POPSpringAnimation(propertyNamed: kPOPViewScaleXY)
        print(frame.width/btn1.frame.width)
        pop.toValue = NSValue(CGSize: CGSizeMake(1,1))
        pop_addAnimation(pop, forKey: "abc")
        
        
        var pop2 = POPSpringAnimation(propertyNamed: kPOPViewCenter)
        pop2.toValue = NSValue(CGPoint: CGPointMake(160,284))
        pop_addAnimation(pop2, forKey: "abc2")
    }
    
    
}
