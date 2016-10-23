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
    @IBAction func button(_ sender: AnyObject) {
        view.makeToast("Login Failed.")
    }
}
