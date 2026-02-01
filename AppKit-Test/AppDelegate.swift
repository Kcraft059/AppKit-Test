//
//  Untitled.swift
//  AppKit-Test
//
//  Created by Camille on 01/02/2026.
//

import Cocoa

final class AppDelegate: NSObject, NSApplicationDelegate {
  private var window: NSWindow!

  func applicationDidFinishLaunching(_ notification: Notification) {
    let vc = MainViewController()
    
    window = MainWindow()
    
    window.contentView = vc.view
    window.contentViewController = vc

    window.center()
    window.title = "Pure AppKit"
    window.makeKeyAndOrderFront(nil)
  }

  func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication)
    -> Bool
  {
    true
  }
}
