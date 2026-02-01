//
//  Window.swift
//  AppKit-Test
//
//  Created by Camille on 01/02/2026.
//

import Cocoa

final class MainWindow: NSWindow {
  init() {
    super.init(
      contentRect: NSRect(x: 0, y: 0, width: 970, height: 640),
      styleMask: [
        .titled,
        .closable,
        .miniaturizable,
        .resizable,
        .fullSizeContentView,
      ],
      backing: .buffered,
      defer: false
    )
    
    backgroundColor = .clear
    isOpaque = false
    titlebarAppearsTransparent = true
  }
}
