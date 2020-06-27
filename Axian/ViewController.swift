//
//  ViewController.swift
//  Axian
//
//  Created by Admin on 6/27/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let story = UIStoryboard.init(name: "SearchViewController", bundle: nil)
        let view = story.instantiateViewController(identifier: "SearchViewController")
        self.present(view, animated: true, completion: nil)
    }

}

