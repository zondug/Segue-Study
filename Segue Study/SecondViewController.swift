//
//  SecoundViewController.swift
//  Segue Study
//
//  Created by Zondug Kim on 2018. 1. 8..
//  Copyright © 2018년 Zondug Kim. All rights reserved.
//

import UIKit

// protocol 정의. 보통은 파일을 따로 뺀다고 함.
// 받을 데이터들을 여기다가 주욱 나열하면 된다는 것이군. 
protocol CanReceive {
	func dataReceived(data: String)
}

class SecondViewController: UIViewController {

	// delegate는 protocol에서 받아오는 것
	var delegate: CanReceive?
	var data = ""
	
    override func viewDidLoad() {
		
		super.viewDidLoad()
		
		// 1 -> 2로 넘어온 data를 label에 넣음
		label.text = data

	}
	@IBOutlet var label: UILabel!
	
	@IBAction func button(_ sender: UIButton) {
		
		// 데이터를 델리게이트로 넘김
		delegate?.dataReceived(data: label.text!)
		
		// 현재 화면을 dismiss
		dismiss(animated: true, completion: nil)

	}

}
