//
//  hw 1 okay version.swift
//
//  Created by Amiya Kishore on 2/10/22.
//

import SwiftUI

struct ContentView: View {

    @State var radius = "5.0"
    @State var sphereArea = ""
    @State var sphereVolume = ""
    @State var boxArea = ""
    @State var boxVolume = ""

    var body: some View {
        VStack{
           
            Text("Radius")
                .padding(.bottom, 0)
            TextField("Radius", text: $radius, onCommit: {newCalculations()})
               
            
            Text("Area of Sphere")
                .padding(.bottom, 0)
            TextField("", text: $sphereArea)
                

            Text("Volume of Sphere")
                .padding(.bottom, 0)
            TextField("", text: $sphereVolume)
                

            Text("Area of Bounding Box")
                .padding(.bottom, 0)
            TextField("", text: $boxArea)
              

            Text("Volume of Bounding Box")
                .padding(.bottom, 0)
            TextField("", text: $boxVolume)
               
        }

        VStack {
            
            Button("Calculate", action: {newCalculations()})
                .padding(.bottom)
        }
    }

    func newCalculations() {
       
            sphereArea = 4.0 * Double.pi * Double(radius) * Double(radius)
            sphereVolume = 4.0 / 3.0 * Double.pi * Double(radius) * Double(radius) * Double(radius)
            boxArea = 6 * (2 * Double(radius)) * (2 * Double(radius))
            boxVolume = (2 * Double(radius)) * (2 * Double(radius)) * (2 * Double(radius))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
