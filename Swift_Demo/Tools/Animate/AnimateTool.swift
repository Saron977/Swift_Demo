//
//  AnimateTool.swift
//  Swift_Demo
//
//  Created by 王傲擎 on 2019/5/5.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import UIKit

/// 果冻动画
class SpringAnimate {
    var backView: UIView!;
    var contentView: UIView!;
    var centerPoint: CGPoint!;
    var shapeLayer: CAShapeLayer!;
    var pointView: UIView!;
    var displayLink: CADisplayLink!;
    
    func springAnimateInit(view: UIView) -> UIView {
        self.backView = view
        contentView = UIView(frame: CGRect(x: 0, y: 64, width: backView.frame.size.width, height: 300))
        contentView.backgroundColor = UIColor.brown
        
        centerPoint = contentView.center
        
        shapeLayer = CAShapeLayer()
        shapeLayer.frame = contentView.frame
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.path = calculatePathWithPoint(point: centerPoint).cgPath
        contentView.layer .addSublayer(shapeLayer)
        
        pointView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        pointView.backgroundColor = UIColor.green
        pointView.center = contentView.center
        contentView.addSubview(pointView)
        
        displayLink = CADisplayLink.init(target: self, selector: #selector(displayLinkEvent))
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
        
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(panGestureEvent(sender:)))
        contentView.addGestureRecognizer(pan)
        return contentView
    }
    
    
    @objc func displayLinkEvent(){
        let layer = pointView.layer.presentation()
        shapeLayer.path = calculatePathWithPoint(point: layer!.position).cgPath
    }
    
    
    @objc func panGestureEvent(sender: UIPanGestureRecognizer) {
        let point = sender.location(in: sender.view)
        let calculatePoint = CGPoint(x: (point.x + centerPoint.x)/2, y: (point.y + centerPoint.y)/2)
        if sender.state == UIGestureRecognizer.State.changed {
            shapeLayer.path = calculatePathWithPoint(point: calculatePoint).cgPath
            pointView.center = calculatePoint
        }else if sender.state == UIGestureRecognizer.State.ended || sender.state == UIGestureRecognizer.State.failed || sender.state == UIGestureRecognizer.State.cancelled{
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.25, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.pointView.center = self.contentView.center
            }) { (_) in
                self.pointView.center = self.contentView.center
            }
        }
        
    }
    
    func calculatePathWithPoint(point: CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 150))
        path.addLine(to: CGPoint(x: 0, y: 300))
        path.addLine(to: CGPoint(x: backView.frame.size.width, y: 300))
        path.addLine(to: CGPoint(x: backView.frame.size.width, y: 150))
        path.addQuadCurve(to: CGPoint(x: 0, y: 150), controlPoint: point)
        return path
    }
}
