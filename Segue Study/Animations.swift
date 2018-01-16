//
//  Animations.swift
//  Segue Study
//
//  Created by Zondug Kim on 2018. 1. 16..
//  Copyright © 2018년 Zondug Kim. All rights reserved.
//

import UIKit

enum FadeAnimationType {
	case fadeIn
	case fadeOut
}

class Animations: CAAnimation {

	// Fade-In, Fade-Out
	func fadeAnimation(fadeType: FadeAnimationType, duration: CFTimeInterval = 0.3, timingFunction: CAMediaTimingFunction) -> CAAnimation {
		
		let opacityAnimation = CABasicAnimation(keyPath: "opacity")
		
		opacityAnimation.fromValue = CGFloat(fadeType == .fadeIn ? 0: 1)
		opacityAnimation.toValue = CGFloat(fadeType == .fadeIn ? 1: 0)
		opacityAnimation.timingFunction = timingFunction
		opacityAnimation.repeatCount = 1
		
		return opacityAnimation
	}
	
	// move position
	func positionChangeAnimation(from fromPosition: CGPoint, to toPosition: CGPoint, duration: CFTimeInterval = 0.3, timingFunction: CAMediaTimingFunction) -> CAAnimation {
		
		let moveAnimation = CABasicAnimation(keyPath: "position")
		
		moveAnimation.fromValue = fromPosition
		moveAnimation.toValue = toPosition
		moveAnimation.timingFunction = timingFunction
		moveAnimation.repeatCount = 1
		
		return moveAnimation
	}
	
	// 크기 변경을 제공한다.
	func resizeAnimation(from fromBounds: CGRect, to toBounds: CGRect, duration: CFTimeInterval = 0.3, timingFunction: CAMediaTimingFunction) -> CAAnimation {
		
		let resizeAnimation = CABasicAnimation(keyPath: "bounds")
		
		resizeAnimation.fromValue = fromBounds
		resizeAnimation.toValue = toBounds
		resizeAnimation.timingFunction = timingFunction
		resizeAnimation.repeatCount = 1
		
		return resizeAnimation
	}
	
	/**
	애니메이션 그룹을 편리하게 추가할 수 있게 도와주는 메소드.
	- Parameter isRemovedOnCompletion: 해당 필드를 false로 하지 않으면 애니메이션이 끝난 뒤에, layer의 속성이 원래대로 돌아간다.
	왠만하면 false로 계속 두고 쓰는게 좋다.
	*/
	func addGroupAnimation(to layer: CALayer, duration: CFTimeInterval, animations: [CAAnimation], isRemovedOnCompletion: Bool = false, completion: (() -> Void)? = nil) {
		
		for animation in animations {
			animation.duration = duration
		}
		
		let groupAnimation = CAAnimationGroup()
		
		groupAnimation.animations = animations
		groupAnimation.repeatCount = 1
		groupAnimation.duration = duration
		groupAnimation.fillMode = kCAFillModeForwards
		groupAnimation.isRemovedOnCompletion = isRemovedOnCompletion
		
		CATransaction.begin()
		
		CATransaction.setCompletionBlock {
			completion?()
		}
		
		layer.add(groupAnimation, forKey: "groupAnimation")
		
		CATransaction.commit()
	}

}
