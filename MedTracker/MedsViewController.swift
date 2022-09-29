//
//  MedsViewController.swift
//  MedTracker
//
//  Created by Neale Taylor on 2022-09-22.
//

import Cocoa

class MedsViewController: NSViewController {

    @IBOutlet var textLabel: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        displayMed()
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
