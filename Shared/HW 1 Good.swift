//  hw 1 good version.swift

//  Created by Amiya Kishore on 2/12/22.


import SwiftUI
struct ContentView: View {
    
    @State var radiusStr = "5.0"
    @State var sphereArea = ""
    @State var sphereVolume = ""
    @State var boxArea = ""
    @State var boxVolume = ""
    @ObservedObject private var sphereModel = Sphere()
    
        var body: some View {
            VStack{
                //Radius
                Text("Radius")
                TextField("Radius", text: $radiusStr, onCommit: {sphereModel.setRadius(radiusStr)})
                TextField("Radius", text: $radiusStr, onCommit: {sphereModel.setRadius(Radius: radiusStr)})
                    
                
                //Sphere Area
                Text("Area of Sphere")
                    .padding(.bottom, 0)
                TextField("", text: $sphereArea)
                //Sphere Volume
                Text("Volume of Sphere")
                    .padding(.bottom, 0)
                TextField("", text: $sphereVolume)
               
                //BB Area
                Text("Area of Bounding Box")
                    .padding(.bottom, 0)
                TextField("", text: $boxArea)
                //BB Volume
                Text("Volume of Bounding Box")
                    .padding(.bottom, 0)
                TextField("", text: $boxVolume)
                
                struct ContentView: View {
                    .padding(.top, 0)
                    .padding(.bottom, 10)

            }

            VStack {
                //Calculate area
                Button("Calculate", action: {sphereModel.setRadius(radiusStr)})
                Button("Calculate", action: {sphereModel.setRadius(Radius: radiusStr)})
                    .padding(.bottom)
            
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
