//
//  _BackgroundView.swift
//  ebms-technical
//
//  Created by TienNVan on 4/15/20.
//  Copyright © 2020 MHT. All rights reserved.
//

import UIKit

class _BackgroundView: UIView {
    
    var radius: CGFloat = 28 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var startColor = UIColor(red: 51/255, green: 115/255, blue: 199/255, alpha: 1)
    var endColor = UIColor(red: 46/255, green: 187/255, blue: 228/255, alpha: 1)
    
    var barHeight: CGFloat = 44
    
    @available(iOS 11.0, *)
    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.saveGState()
        
        context.clear(rect)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        guard let startColorComponents = startColor.cgColor.components else {
            return
        }
        guard let endColorComponents = endColor.cgColor.components else {
            return
        }
        
        let colorComponents: [CGFloat] = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
        
        let locations:[CGFloat] = [0.0, 1.0]
        
        guard let gradient = CGGradient(colorSpace: colorSpace,colorComponents: colorComponents,locations: locations,count: 2) else { return }
        
        let startPoint = CGPoint(x: 0, y: 0)
        var endPoint: CGPoint
        if #available(iOS 11.0, *) {
            endPoint = CGPoint(x: rect.width, y: safeAreaInsets.top + barHeight + radius)
        } else {
            endPoint = CGPoint(x: rect.width, y: UIApplication.shared.statusBarFrame.height + barHeight + radius)
        }
        
        context.saveGState()
        context.addRect(CGRect(x: 0, y: 0, width: rect.width, height: endPoint.y))
        context.clip()
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
        context.restoreGState()
        
        let y: CGFloat
        if #available(iOS 11.0, *) {
            y = safeAreaInsets.top + barHeight
        } else {
            y = UIApplication.shared.statusBarFrame.height + barHeight
        }
        let roundRect = CGRect(x: 0, y: y, width: rect.width, height: rect.height - y)
        let path = UIBezierPath(roundedRect: roundRect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: radius, height: radius))
        UIColor.white.setFill()
        path.fill()
        context.addPath(path.cgPath)
        
        context.restoreGState()
    }
    
}


class _HomeBackgroundView: UIView {
    
    var additionalHeight: CGFloat = 64 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var startColor = UIColor(red: 51/255, green: 115/255, blue: 199/255, alpha: 1)
    var endColor = UIColor(red: 46/255, green: 187/255, blue: 228/255, alpha: 1)
    
    var barHeight: CGFloat = 44
    
    @available(iOS 11.0, *)
    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.saveGState()
        
        UIColor.white.setFill()
        context.fill(rect)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        guard let startColorComponents = startColor.cgColor.components else {
            return
        }
        guard let endColorComponents = endColor.cgColor.components else {
            return
        }
        
        let colorComponents: [CGFloat] = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
        
        let locations:[CGFloat] = [0.0, 1.0]
        
        guard let gradient = CGGradient(colorSpace: colorSpace,colorComponents: colorComponents,locations: locations,count: 2) else { return }
        
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint: CGPoint
        if #available(iOS 11.0, *) {
            endPoint = CGPoint(x: rect.width, y: safeAreaInsets.top + barHeight + additionalHeight)
        } else {
            endPoint = CGPoint(x: rect.width, y: UIApplication.shared.statusBarFrame.height + barHeight + additionalHeight)
        }
        
        context.saveGState()
        context.addRect(CGRect(x: 0, y: 0, width: rect.width, height: endPoint.y))
        context.clip()
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
        context.restoreGState()
        
        context.restoreGState()
    }
}
