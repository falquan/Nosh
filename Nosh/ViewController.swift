//
//  ViewController.swift
//  Nosh
//
//  Created by Falquan on 4/4/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var queryTextField: UITextField!

    // MARK: Actions
    @IBAction func searchButtonOnTouchUpInside(sender: UIButton) {
        let feedbag = Feedbag(apiKey: AppDelegate.apiKey)
        let query = SearchOptions()

        query.query = queryTextField.text!

        feedbag.search(query)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

