//
//  AppDelegate.swift
//  MedTracker
//
//  Created by Neale Taylor on 2022-09-22.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let popover = NSPopover()

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)

    @objc func showMeds(_ sender: Any?) {
        let medName = "Concerta 18mg"
        let medTime = "10am"
        print("\(medName) at \(medTime)")
    }
    
    @objc func togglePopover(_ sender: Any?) {
      if popover.isShown {
        closePopover(sender: sender)
      } else {
        showPopover(sender: sender)
      }
    }

    func showPopover(sender: Any?) {
      if let button = statusItem.button {
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
      }
        
      eventMonitor?.start()
    }


    func closePopover(sender: Any?) {
      popover.performClose(sender)
        
      eventMonitor?.stop()
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        
        if let statusButton = statusItem.button {
            statusButton.image = NSImage(systemSymbolName: "pills.fill", accessibilityDescription: "Pills")
            statusButton.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = MedsViewController.freshController()
        
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
          if let strongSelf = self, strongSelf.popover.isShown {
            strongSelf.closePopover(sender: event)
          }
        }
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
    
    var eventMonitor: EventMonitor?

}

