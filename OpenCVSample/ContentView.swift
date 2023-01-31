//
//  ContentView.swift
//  OpenCVSample
//
//  Created by 藤治仁 on 2023/01/31.
//

import SwiftUI

struct ContentView: View {
    @State var image: UIImage?
    @State var isFiltered: Bool = false

    var body: some View {
        VStack {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("No Image")
            }
            Button {
                isFiltered.toggle()
                refreshImage(isFiltered: isFiltered)
            } label: {
                if isFiltered {
                    Text("Original Image")
                } else {
                    Text("Filter Image")
                }
            }

        }
        .onAppear {
            refreshImage(isFiltered: false)
        }
    }
    
    func refreshImage(isFiltered: Bool) {
        if isFiltered {
            image = OpenCVBridge.filteredImage()
        } else {
            image = UIImage(named: "sampleImage")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
