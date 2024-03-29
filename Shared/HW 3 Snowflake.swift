//
//  HW 3 Snowflake.swift
//  PHYS440
//
//  Created by Amiya Kishore on 3/20/22.
//

import Foundation

import UIKit

class kochFlake: UIView {
    var x = 0, y = 0, a = 0
    
    //number of sides is n = 3*4^a
    //length of side is x*3^-a
    //perimeter is (3a)*(4/3)^a
    
    func forward(_length: Int) {
        
        //calculating the places according to circle
        w = Double.pi * Double(a % 360) / 180.0
        x += Int((Double(length) * cos(w)))
        y += Int((Double(length) * sin(w)))
        
        let UIcontx = UIGraphicsGetCurrentContext()
        UIcontx.addLine(to: CGPoint(x: x, y: y))
    }
    
    //using degrees might be easier since an equilateral triangle would use 60 degrees each
    func left degrees(_ degrees: Int) { a -= degrees }
    func right degrees(_ degrees: Int) { a += degrees }
    
    func koch(_n: Int) {
        if n == 1 {
            forward(_length: 7)
        }
        else {
            koch(n - 1)
            left(60)
            koch(n - 1)
            right(120)
            koch(n - 1)
            left(60)
            koch(n - 1)
        }
    }
    
    func draw(_rect: CGRect) {
        x = 10
        y = Int(rect.size.height) - 10
        a = 0

        //setting the background as white and the snowflake as blue
        let UIcontx = UIGraphicsGetCurrentContext()
        UIcontx.move(to: CGPoint(x: x, y: y))
        koch(5)
        backgroundColor = UIColor.white
        UIColor.blue.setStroke()
        UIcontx.drawPath.stroke()
    }
}

let view = kochFlakeView(frame: CGRect(x: 0, y: 0, width: 1000, height: 500))
