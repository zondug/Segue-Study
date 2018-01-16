//
//  Transitions.swift
//  Segue Study
//
//  Created by Zondug Kim on 2018. 1. 12..
//  Copyright © 2018년 Zondug Kim. All rights reserved.
//

import UIKit

enum AnimationType {
	case Scale
	case Spiral
}

class Transitions: UIStoryboardSegue {
	
	let animation = Animations()

//	open var duration = 0.1
	
	// 트랜지션 종류를 여러 개를 만들고 각각을 랜덤으로 넘기는 걸 만들어 보자
	
	var animationType = AnimationType.Scale
	
	override func perform() {
		
		switch animationType {
		case .Scale:
			animateScale()
		case .Spiral:
			animateSpiral()
		}
	}
	
// Transition Animation을 지정하려면 Storyboard Segue Class에서 Transitions를 설정해줘야 함
// Transitions는 UIStoryboardSegue를 상속하므로 self.source, .destination 가능
	func animateScale() {
		let fromVC = self.source
		let toVC = self.destination
		
		let containerView = fromVC.view.superview
		let orginalCenter = fromVC.view.center
		
		toVC.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
		toVC.view.center = orginalCenter
		
		containerView?.addSubview(toVC.view)
		
		UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut,
					   animations: { toVC.view.transform = CGAffineTransform.identity},
					   completion: { success in fromVC.present(toVC, animated: false, completion: nil)}
		)
	}
	
	// Animation group을 써야 하나보다
	func animateSpiral() {
		let fromVC = self.source
		let toVC = self.destination
		
		let containerView = fromVC.view.superview
		let orginalCenter = fromVC.view.center
		
		toVC.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
		toVC.view.center = orginalCenter
		
		containerView?.addSubview(toVC.view)
		
		UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
			UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {

				
			})
			UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {

			})
		}, completion: {
			success in fromVC.present(toVC, animated: false, completion: nil)}
		)
	}
	
}



