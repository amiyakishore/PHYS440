//
//  hw 2 summation.swift
//
//  Created by Amiya Kishore on 2/26/22.
//
//  Write a single-precision program that calculates S(1), S(2), and S(3)
//

import Foundation

//S(1)
var n = 1
var sum1 = pow(-1, n) * (n/(n+1))
print sum1

//S(2)
var n = 1
var sum2 = (-((2*n)-1)/(2*n)) + ((2*n)/((2*n)+1))
print sum2

//S(3)
var n = 1
var sum3 = (1/((2*n)((2*n)+1))
print sum3
