//
//  hw 2 quadratic.swift
//
// Created by Amiya Kishore on 2/24/22.

// 1. Write a program that calculates all four solutions for arbitrary values of a, b, and c.


import Foundation

func quadSolve(a: Double, b: Double, c: Double) -> [Double, Double] {
    
    var d = pow(b, 2) - (4 * a * c) // discriminant
    
    if -threshold < d && d < threshold { d = 0 }
    if d > 0 {
        //for values when the discriminant is greater than zero
        let x_1 = (-b + sqrt(pow(b, 2) - (4 * a * c))) / (2 * a)
        let x_2 = (-b - sqrt(pow(b, 2) - (4 * a * c))) / (2 * a)
        roots = [x_1, x_2]
    } else if d == 0 {
        let x = -b/(2*a)
        roots = [x, x]
    } else if d < 0 {
        let x_1 = (-b/(2*a), sqrt(-d)/(2*a))
        let x_2 = (-b/(2*a), -sqrt(-d)/(2*a))
        roots = [x_1, x_2]
    }

    return roots
}
