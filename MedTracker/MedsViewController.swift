//
//  MedsViewController.swift
//  MedTracker
//
//  Created by Neale Taylor on 2022-09-22.
//

import Cocoa

class MedsViewController: NSViewController {

    @IBOutlet var textLabel: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        displayMed()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        tableView.reloadData()
    }
    
    let meds = Meds.all
    

    func displayMed() {
        textLabel.stringValue = String(describing: meds)
    }
}

extension MedsViewController {
  @IBAction func quit(_ sender: NSButton) {
      NSApplication.shared.terminate(sender)
  }
}

extension MedsViewController {
  // MARK: Storyboard instantiation
  static func freshController() -> MedsViewController {
    let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
    let identifier = NSStoryboard.SceneIdentifier("MedsViewController")
    guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? MedsViewController else {
      fatalError("Why cant i find MedsViewController? - Check Main.storyboard")
    }
    return viewcontroller
  }
}

extension MedsViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return meds.count
    }
}

extension MedsViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let currentMed = meds[row]
        
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "idColumn") {
            
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "idCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else { return nil }
            cellView.textField?.integerValue = currentMed.id ?? 0
            return cellView
            
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "medicationColumn") {
            
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "medicationCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else { return nil }
            cellView.textField?.stringValue = currentMed.name
            return cellView
            
        } else {
            
        }
        
        return nil
    }
}
