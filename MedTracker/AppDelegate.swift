//
//  AppDelegate.swift
//  MedTracker
//
//  Created by Neale Taylor on 2022-09-22.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)

    @objc func showMeds(_ sender: Any?) {
        let medName = "Concerta 18mg"
        let medTime = "10am"
        print("\(medName) at \(medTime)")
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        
        if let statusButton = statusItem.button {
            statusButton.image = NSImage(systemSymbolName: "pills.fill", accessibilityDescription: "Pills")
            statusButton.action = #selector(showMeds)
        }
        constructMenu()

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

    func constructMenu() {
      let menu = NSMenu()

      menu.addItem(NSMenuItem(title: "Show Meds", action: #selector(AppDelegate.showMeds(_:)), keyEquivalent: "P"))
      menu.addItem(NSMenuItem.separator())
      menu.addItem(NSMenuItem(title: "Quit Med Showing", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

      statusItem.menu = menu
    }
}

