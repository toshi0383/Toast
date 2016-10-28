//
//  ViewController.swift
//  Toast
//
//  Created by toshi0383 on 2016/10/23.
//
//

import Foundation
import Toast
import AppKit

class ViewController: NSViewController {
    var toggle = true
    override func viewDidAppear() {
        super.viewDidAppear()
        view.makeToast("Login Failed.")
    }
    @IBAction func button(_ sender: AnyObject) {
        if toggle {
            view.makeToastActivity()
        } else {
            view.hideToastActivity()
        }
        toggle = !toggle
    }
}
