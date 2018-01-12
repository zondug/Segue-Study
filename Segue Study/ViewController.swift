//
//  ViewController.swift
//  Segue Study
//
//  Created by Zondug Kim on 2018. 1. 8..
//  Copyright © 2018년 Zondug Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanReceive {

	override func viewDidLoad() {

		super.viewDidLoad()
		receivedData.isHidden = true
		
	}

	@IBOutlet var textField: UITextField!
	@IBOutlet var receivedData: UILabel!
	
	@IBAction func buttonPressed(_ sender: UIButton) {
		
		performSegue(withIdentifier: "gotoSecondScreen", sender: self)
		 
	}
	
	func dataReceived(data: String) {
		receivedData.isHidden = false
		receivedData.text = data
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "gotoSecondScreen" {
			
			let destinationVC = segue.destination as! SecondViewController
			destinationVC.data = textField.text!
			
			destinationVC.delegate = self
			
		}
	}
	
}

