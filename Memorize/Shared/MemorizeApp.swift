//
//  MemorizeApp.swift
//  Shared
//
//  Created by Viraj Lakshitha Bandara on 2022-05-02.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

