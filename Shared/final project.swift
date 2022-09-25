//
//  final project.swift
//  
//
//  Created by Amiya Kishore on 9/25/22.
//


import Cocoa;
import Darwin;

import Foundation;
class MD
{
    
    static var L : Double?;
    static var Natom : Int = 8;
    static var Nmax : Int = 513;
    // Class variables
    static var x : [Double] = Array(repeating: 0.0, count: MD.Nmax);
    static var fx : [[Double]] = Array(repeating: Array(repeating: 0.0, count: 2), count: MD.Nmax);
    static func main(_argv:inout[String])
    {
        var t1 : Int;
        var t2 : Int;
        var i : Int;
        var Itemp : Int;
        var t : Int;
        let Nstep : Int = 5000;
        let Nprint : Int = 100;
        let Ndim : Int = 1;
        let h : Double = 4.0E-4;
        var hover2 : Double;
        var PE : Double;
        var KE : Double;
        var T : Double;
        let Tinit : Double = 10.0;
        var vx : [Double] = Array(repeating: 0.0, count: MD.Nmax);
        MD.L = pow(1.0 * Double(MD.Natom),1.0 / Double(Ndim));
        MD.Natom = Int(pow(MD.L!,Double(Ndim)));
        print("Natom = " + String(MD.Natom) + " L= " + String(MD.L!) + "");
        i = -1;
        do
        {
            var ix : Int = 0;
            while (ix <= MD.L! - 1)
            {
                // lattice of side L
                i = i + 1;
                MD.x[i] = Double(ix);
                // Initial velocities
                vx[i] = (arc4random() + arc4random() + arc4random() + arc4random() + arc4random() + arc4random() + arc4random() + arc4random() + arc4random() + arc4random() + arc4random() + arc4random()) / 12.0 - 0.5;
                vx[i] = vx[i] * (Tinit).squareRoot();
                // Scale  temperature
                print(" init vx = " + String(vx[i]));
                ix += 1;
            }
        }
        t1 = 0;
        t2 = 1;
        // t, t+h indices
        hover2 = h / 2.0;
        t = 0;
        KE = 0.0;
        PE = 0.0;
        // initial KE & PE v
        PE = MD.Forces(t1,PE);
        do
        {
            i = 0;
            while (i <= MD.Natom - 1)
            {
                KE = KE + (vx[i] * vx[i]) / 2;
                i += 1;
            }
        }
        print(String(t) + " PE= " + String(PE) + " KE = " + String(KE) + " PE+KE = " + String((PE + KE)));
        do
        {
            t = 1;
            while (t < Nstep)
            {
                do
                {
                    i = 0;
                    while (i <= MD.Natom - 1)
                    {
                        // Main loop
                        PE = MD.Forces(t1,PE);
                        // Velocity Verlet
                        MD.x[i] = MD.x[i] + h * (vx[i] + hover2 * MD.fx[i][t1]);
                        if (MD.x[i] <= 0.0)
                        {
                            MD.x[i] = MD.x[i] + MD.L!;
                        }
                        // PBC
                        if (MD.x[i] >= MD.L!)
                        {
                            MD.x[i] = MD.x[i] - MD.L!;
                        }
                        i += 1;
                    }
                }
                PE = MD.Forces(t2,PE);
                KE = 0.0;
                do
                {
                    i = 0;
                    while (i <= MD.Natom - 1)
                    {
                        vx[i] = vx[i] + hover2 * (MD.fx[i][t1] + MD.fx[i][t2]);
                        KE = KE + (vx[i] * vx[i]) / 2;
                        i += 1;
                    }
                }
                T = 2.0 * KE / (3.0 * Double(MD.Natom));
                if (t % Nprint == 0)
                {print(String(t) + " PE =" + String(PE) + " KE = " + String(KE) + " PE+KE = " + String((PE + KE)));
                }
                Itemp = t1;
                // Time t and t +h
                t1 = t2;
                t2 = Itemp;
                t += 1;
            }
        }
    }
    
    static func Forces(_ t : Int, _ PE : Double) -> Double
    {
        var i : Int;
        var j : Int;
        var fijx : Double;
        var r2 : Double;
        var invr2 : Double = 0;
        var dx : Double;
        let r2cut : Double = 9.0;
        var PE = 0.0;
        do
        {
            i = 0;
            // Initialize
            while (i <= MD.Natom - 1)
            {
                MD.fx[i][t] = 0.0;
                i += 1;
            }
        }
        do
        {
            i = 0;
            while (i <= MD.Natom - 2)
            {
                do
                {
                    j = i + 1;
                    while (j <= MD.Natom - 1)
                    {
                        dx = MD.x[i] - MD.x[j];
                        if (abs(dx) > 0.5 * MD.L!)
                        {
                            dx = dx - MD.sign(MD.L!,dx);
                        }
                        // PBC
                        r2 = dx * dx;
                        if (r2 < r2cut)
                        {
                            // Cut off
                            if (r2 == 0.0)
                            {
                                r2 = 1.0E-4;
                            }
                            invr2 = 1.0 / r2;
                            fijx = 48.0 * (pow(invr2,Double(3)) - 0.5) * pow(invr2,Double(3));
                            fijx = fijx * invr2 * dx;
                            MD.fx[i][t] = MD.fx[i][t] + fijx;
                            MD.fx[j][t] = MD.fx[j][t] - fijx;
                            PE = PE + 4 * pow(invr2,Double(3)) * (pow(invr2,Double(3)) - 1.0);
                        }
                        j += 1;
                    }
                }
                i += 1;
            }
        }
        return PE;
    }
    static func sign(_ a : Double, _ b : Double) -> Double
    {
        if (b >= 0.0)
        {
            return abs(a);
        }
        else
        {
            return -abs(a);
        }
    }
}

var record : [String] = CommandLine.arguments;
MD.main(_argv: &record);
