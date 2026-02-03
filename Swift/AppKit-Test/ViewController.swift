//
//  ViewController.swift
//  AppKit-Test
//
//  Created by Camille on 01/02/2026.
//

import Cocoa

final class MainViewController: NSViewController {
  override func loadView() {
    view = NSView()
    view.wantsLayer = true

    let label = NSTextField(labelWithString: "Hello World!")
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)

    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])

    let glassView = NSGlassEffectView()
    glassView.translatesAutoresizingMaskIntoConstraints = false
    glassView.style = .clear
    glassView.tintColor = NSColor(srgbRed: 0.0, green: 0.0, blue: 0.0, alpha: 0.25)
    
    view.addSubview(glassView,positioned: NSWindow.OrderingMode.below, relativeTo: label)

    NSLayoutConstraint.activate([
      glassView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      glassView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      glassView.topAnchor.constraint(equalTo: view.topAnchor),
      glassView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }

}
