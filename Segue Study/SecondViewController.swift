//
//  SecoundViewController.swift
//  Segue Study
//
//  Created by Zondug Kim on 2018. 1. 8..
//  Copyright © 2018년 Zondug Kim. All rights reserved.
//

import UIKit

protocol CanReceive {
	
	func dataReceived(data: String)
}

class SecondViewController: UIViewController {

	var delegate: CanReceive?
	var data = ""
	
    override func viewDidLoad() {
		
		super.viewDidLoad()
		
		label.text = data
		
	}
	@IBOutlet var label: UILabel!
	
	@IBAction func button(_ sender: UIButton) {
		
		delegate?.dataReceived(data: label.text!)
		dismiss(animated: true, completion: nil)

	}

}
