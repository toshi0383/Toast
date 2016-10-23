//
//  AppDelegate.swift
//  DemoMac
//
//  Created by toshi0383 on 2016/10/23.
//
//

import Cocoa
import AppKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        let sb = NSStoryboard(name: "Main", bundle: .main)
//        mainwc = sb.instantiateInitialController() as? NSWindowController
//        mainwc?.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

