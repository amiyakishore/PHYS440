//
//  HW1 - Bad Version.swift
//  PHYS440
//
//  Created by Amiya Kishore on 2/01/22.
//

import Foundation
import SwiftUI

struct ContentView: View {

    var radius = "5.0"
    var sphereArea = ""
    var sphereVolume = ""

    var bbArea = ""
    var bbVolume = ""

    var body: View {
        VStack{
           
            Text("Radius")
                .padding(.top)
                .padding(.bottom, 0)
            
            TextField("Radius", text: radius, onCommit: {
               
                sphereArea = 4.0 * Double.pi * Double(radius) * Double(radius)
                
                sphereVolume = (4.0 / 3.0) * Double.pi * Double(radius) * Double(radius) * Double(radius)

                bbArea = 6 * (2 * Double(radius)) * (2 * Double(radius))
                
                bbVolume = (2 * Double(radius)) * (2 * Double(radius)) * (2 * Double(radius))
            })
               
           
        VStack {
            
            Button("Calculate", action: {
               
                sphereArea = 4.0 * Double.pi * Double(radius) * Double(radius)
                sphereVolume = 4.0 / 3.0 * Double.pi * Double(radius) * Double(radius) * Double(radius)

               
                bbArea = 6 * (2 * Double(radius)) * (2 * Double(radius))
                bbVolume = (2 * Double(radius)) * (2 * Double(radius)) * (2 * Double(radius))
            })
                .padding(.bottom)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
