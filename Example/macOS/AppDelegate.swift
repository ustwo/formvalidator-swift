//
//  AppDelegate.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 06/01/2017.
//  Copyright © 2017 ustwo Fampany Ltd. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    // MARK: - Properties
    
    lazy var window: NSWindow = {
        let result = NSWindow(contentRect: NSRect(x: 0,
                                                  y: 0,
                                                  width: NSScreen.main!.frame.width / 2.0,
                                                  height: NSScreen.main!.frame.height / 2.0),
                              styleMask: [NSWindow.StyleMask.titled, NSWindow.StyleMask.miniaturizable, NSWindow.StyleMask.resizable, NSWindow.StyleMask.closable],
                              backing: .buffered,
                              defer: false)
        
        result.title = "New Window"
        result.isOpaque = false
        result.center()
        result.isMovableByWindowBackground = true
        result.backgroundColor = NSColor.white
        
        return result
    }()
    
    
    // MARK: - NSApplicationDelegate
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let viewController = FormViewController()
        
        window.contentViewController = viewController
        
        window.makeKeyAndOrderFront(self)
    }

}
