//
//  BaseViewController.swift
//  MuiscePlayer
//
//  Created by Mostafa on 11/24/18.
//  Copyright © 2018 Mostafa. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

}
