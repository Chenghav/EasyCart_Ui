//
//  ReduisExtension.swift
//  EasyCart
//
//  Created by Hen Ty on 17/10/23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    @IBInspectable var widthBorder: CGFloat {
        get { return self.widthBorder }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
}

@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

@IBDesignable
class DesignableImageView: UIImageView {
}

enum ViewBorder: String {
    case left, right, top, bottom
}

var cornerRadiusValue : CGFloat = 0
var corners : UIRectCorner = []

//MARK: ->> UIViewController Delegate <<-
extension UIViewController {
    
//    func customAlert(colorRejectBtn: UIColor, rejectTitle: String,colorCancelBtn: UIColor, cancelTitle: String, subtitleReject: String, headtitleReject: String, rejectAction: Completion?, cancelAction: Completion?) {
//
//        let makeChoiceSB  = UIStoryboard(name: "PopUpSB", bundle: nil)
//        let choiceVC      = makeChoiceSB.instantiateViewController(withIdentifier: "PopUpRejectVC") as! PopUpVC
//
//        choiceVC.modalTransitionStyle     = UIModalTransitionStyle.crossDissolve
//        choiceVC.modalPresentationStyle   = UIModalPresentationStyle.overFullScreen
//        present(choiceVC, animated: true, completion: nil)
//
//        choiceVC.initialize(colorReject     : colorRejectBtn,
//                            reject          : rejectTitle,
//                            colorCancel     : colorCancelBtn,
//                            cancel          : cancelTitle,
//                            subtitle        : subtitleReject,
//                            headtitle       : headtitleReject,
//                            rejectAction    : {
//                                                choiceVC.dismiss(animated: true, completion: nil)
//                                                rejectAction?()
//                                            },
//                            cancelAction    : {
//                                                choiceVC.dismiss(animated: true, completion: nil)
//                                                cancelAction?()
//                                            })
//
//
//    }
//
//    func customAlertOneBtn(headerText: String, subtitleText: String, colorOK: UIColor, OK: String, OKAction: Completion?){
//        let makeChoiceSB  = UIStoryboard(name: "PopUpOneBtnSB", bundle: nil)
//        let choiceVC      = makeChoiceSB.instantiateViewController(withIdentifier: "PopUpOneButtonVC") as! PopUpOneButtonVC
//
//        choiceVC.modalTransitionStyle     = UIModalTransitionStyle.crossDissolve
//        choiceVC.modalPresentationStyle   = UIModalPresentationStyle.overFullScreen
//        present(choiceVC, animated: true, completion: nil)
//
//        choiceVC.initialize(headerTitle : headerText,
//                            subtitle    : subtitleText,
//                            colorOk     : colorOK,
//                            Ok          : OK,
//                            okAction    : {
//
//
//                                            OKAction?()
//                                        })
//
//    }
}


extension UIView {

    func add(border: ViewBorder, color: UIColor, width: CGFloat) {
        let borderLayer = CALayer()
        borderLayer.backgroundColor = color.cgColor
        borderLayer.name = border.rawValue
        switch border {
        case .left:
            borderLayer.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .right:
            borderLayer.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        case .top:
            borderLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        case .bottom:
            borderLayer.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        }
        self.layer.addSublayer(borderLayer)
    }

    func remove(border: ViewBorder) {
        guard let sublayers = self.layer.sublayers else { return }
        var layerForRemove: CALayer?
        for layer in sublayers {
            if layer.name == border.rawValue {
                layerForRemove = layer
            }
        }
        if let layer = layerForRemove {
            layer.removeFromSuperlayer()
        }
    }

}

extension UIView {

        @IBInspectable public var topLeft : Bool {
            get {
                return corners.contains(.topLeft)
            }
            set {
                setCorner(newValue: newValue, for: .topLeft)
            }
        }

        @IBInspectable public var topRight : Bool {
            get {
                return corners.contains(.topRight)
            }
            set {
                setCorner(newValue: newValue, for: .topRight)
            }
        }

        @IBInspectable public var bottomLeft : Bool {
            get {
                return corners.contains(.bottomLeft)
            }
            set {
                setCorner(newValue: newValue, for: .bottomLeft)
            }
        }

        @IBInspectable public var bottomRight : Bool {
            get {
                return corners.contains(.bottomRight)
            }
            set {
                setCorner(newValue: newValue, for: .bottomRight)
            }
        }

        func setCorner(newValue: Bool, for corner: UIRectCorner) {
            if newValue {
                addRectCorner(corner: corner)
            } else {
                removeRectCorner(corner: corner)
            }
        }

        func addRectCorner(corner: UIRectCorner) {
            corners.insert(corner)
            updateCorners()
        }

        func removeRectCorner(corner: UIRectCorner) {
            if corners.contains(corner) {
                corners.remove(corner)
                updateCorners()
            }
        }

        func updateCorners() {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadiusValue, height: cornerRadiusValue))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }



    func bound() {
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 0.1,
            options: UIView.AnimationOptions.beginFromCurrentState,
            animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }

    func gone() {
        DispatchQueue.main.async {
            self.isHidden = true
        }
    }

    func visible() {
        DispatchQueue.main.async {
            self.isHidden = false
        }
    }

    var isGone: Bool {
        return self.isHidden == true
    }

    var isVisible: Bool {
        return self.isHidden == false
    }

    @IBInspectable
    var circular: Bool {
        get {
            return false
        }
        set {
            layer.cornerRadius = min(bounds.width, bounds.height) / 2
        }
    }

//    @IBInspectable
//    var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//        }
//    }

    @IBInspectable
    var cornerAllRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
        }
    }

    @IBInspectable
    var cornerTopRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            } else {
                // Fallback on earlier versions
            }
        }
    }

    @IBInspectable
    var cornerBottomRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
        }
    }

    @IBInspectable
    var cornerLeftRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
        }
    }

    @IBInspectable
    var cornerRightRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            } else {
                // Fallback on earlier versions
            }
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }

    @IBInspectable
    /// Corner radius of view; also inspectable from Storyboard.
    public var maskToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }

    public func dashStyle(){
        self.layer.layoutIfNeeded()
        let shapeLayer = CAShapeLayer()
        let selfBounds = self.frame.size

        let newBounds = CGRect(x: 0, y: 0, width: selfBounds.width, height: selfBounds.height)


        shapeLayer.name = "dash"
        shapeLayer.position = CGPoint(x: selfBounds.width / 2, y: selfBounds.height / 2)
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor =  UIColor.gray.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [4, 2]
        self.layer.addSublayer(shapeLayer)
        shapeLayer.bounds = newBounds
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: newBounds.width, height: newBounds.height), cornerRadius: self.cornerRadius).cgPath
    }

    public func underline(forColor: UIColor) {
        let border = CALayer()
        let underlineHeight: CGFloat = 1.0

        border.borderColor = forColor.cgColor
        let selfSize = self.frame.size
        border.frame = CGRect(x: 0, y: selfSize.height - underlineHeight, width: selfSize.width, height: selfSize.height)

        border.borderWidth = underlineHeight
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }







}

