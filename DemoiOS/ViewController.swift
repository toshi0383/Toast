//
//  ViewController.swift
//  DemoiOS
//
//  Created by toshi0383 on 2016/10/23.
//
//

import UIKit
import Toast

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.makeToast("Login Failed.")
    }

    var toggle = true
    @IBAction func button(_ sender: AnyObject) {
        if toggle {
            view.makeToastActivity()
        } else {
            view.hideToastActivity()
        }
        toggle = !toggle
    }
}
