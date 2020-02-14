//
//  ViewController.swift
//  ColorPicker
//
//  Created by alfredo on 2/14/20.
//  Copyright © 2020 Alfredo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func changeColor(_ sender: ColorPicker) {
        view.backgroundColor = sender.color
        
    }


}

