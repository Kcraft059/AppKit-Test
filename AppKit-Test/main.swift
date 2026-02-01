//
//  main.swift
//  AppKit-Test
//
//  Created by Camille on 01/02/2026.
//

import Cocoa

// MARK: Application class

@MainActor
final class Application: NSApplication {

    private let appdelegate = AppDelegate()

    override init() {
        super.init()
        delegate = appdelegate
        setActivationPolicy(.regular)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

// MARK: Entry

let app = Application.shared
app.activate(ignoringOtherApps: true)
app.run()
