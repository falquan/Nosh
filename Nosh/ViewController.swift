//
//  ViewController.swift
//  Nosh
//
//  Created by Falquan on 4/4/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let serviceConfiguration = ServiceConfiguration(serviceId: ServiceIdentification.NDBUSDA, apiKey: AppDelegate.apiKey)
    
    // MARK: Properties
    @IBOutlet weak var queryTextField: UITextField!

    // MARK: Actions
    @IBAction func searchButtonOnTouchUpInside(sender: UIButton) {
        let config = FeedbagConfiguration(serviceConfiguration: self.serviceConfiguration)
        let feedbag = Feedbag(config: config)

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

