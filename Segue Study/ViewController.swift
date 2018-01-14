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

	// 오브젝트 정의
	@IBOutlet var textField: UITextField!
	@IBOutlet var receivedData: UILabel!
	
	// 버튼 액션 정의 1 -> 2
	@IBAction func buttonPressed(_ sender: UIButton) {
		
		performSegue(withIdentifier: "gotoSecondScreen", sender: self)
		
	}
	
	// 2 -> 1 일 때 호출되는 내용들, from protocol
	func dataReceived(data: String) {
		receivedData.isHidden = false
		receivedData.text = data
	}
	
	// 입력 받은 데이터를 2로 넘기기 전에 준비. segue identifier를 통해서 구분을 하므로, identifier를 여러 개 만들 수 있음 
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "gotoSecondScreen" {
			
			let destinationVC = segue.destination as! SecondViewController
			destinationVC.data = textField.text!
			
			destinationVC.delegate = self
			
		}
	}
	
}

