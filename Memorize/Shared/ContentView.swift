//
//  ContentView.swift
//  Shared
//
//  Created by Viraj Lakshitha Bandara on 2022-05-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return ZStack (alignment: .center) {
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth:3)
                .padding(20.0)
            Text("Welcome to the SwiftUI !!!")
                .bold()
        }.foregroundColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
