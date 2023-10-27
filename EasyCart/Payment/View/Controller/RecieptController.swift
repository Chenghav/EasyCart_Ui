//
//  RecieptController.swift
//  EasyCart
//
//  Created by ksga on 18/10/23.
//

import Foundation
import UIKit
class RecieptController : UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
    @IBOutlet weak var tableReciept: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//               customView.backgroundColor = UIColor.white
//               view.addSubview(customView)
        tableReciept.delegate = self
        tableReciept.dataSource = self
        tableReciept.register(UINib(nibName: "ReceiptTableViewCell", bundle: .none), forCellReuseIdentifier: "ReceiptTableViewCell")
        print("hehehe")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableReciept.dequeueReusableCell(withIdentifier: "ReceiptTableViewCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 463
    }
//    class func pathSemiCirclesPathForView(givenView: UIView, circlesRadius:CGFloat = 4, circlesDistance : CGFloat = 3, top:Bool = true, bottom:Bool = true ) ->UIBezierPath
//        {
//            let width = givenView.frame.size.width
//            let height = givenView.frame.size.height
//            
//            let semiCircleWidth = CGFloat(circlesRadius*2)
//            
//            let semiCirclesPath = UIBezierPath()
//            semiCirclesPath.move(to: CGPoint(x:0, y:0))
//            
//            if(bottom) {
//                var x = CGFloat(0)
//                var i = 0
//                while x < width {
//                    x = (semiCircleWidth) * CGFloat(i) + (circlesDistance * CGFloat(i))
//                    let pivotPoint = CGPoint(x: x + semiCircleWidth/2, y: height)
//                    semiCirclesPath.addArc(withCenter: pivotPoint, radius: circlesRadius, startAngle: -180 * .pi / 180.0, endAngle: 0 * .pi / 180.0, clockwise: true)
//                    semiCirclesPath.addLine(to: CGPoint(x: semiCirclesPath.currentPoint.x + circlesDistance, y: height))
//                    i += 1
//                }
//            }
//            else {
//                semiCirclesPath.addLine(to: CGPoint(x: 0, y: height))
//                semiCirclesPath.addLine(to: CGPoint(x: width, y: height))
//            }
//            
//            semiCirclesPath.addLine(to: CGPoint(x:width,y: 0))
//            
//            if(top) {
//                var x = CGFloat(width)
//                var i = 0
//                while x > 0 {
//                    x = width - (semiCircleWidth) * CGFloat(i) - (circlesDistance * CGFloat(i))
//                    let pivotPoint = CGPoint(x: x - semiCircleWidth/2, y: 0)
//                    semiCirclesPath.addArc(withCenter: pivotPoint, radius: circlesRadius, startAngle: 0 * .pi / 180.0, endAngle: -180 * .pi / 180.0, clockwise: true)
//                    semiCirclesPath.addLine(to: CGPoint(x: semiCirclesPath.currentPoint.x - circlesDistance, y: 0))
//                    i += 1
//                }
//            }
//            
//            semiCirclesPath.close()
//            
//            return semiCirclesPath
//        }
//    
//}
//class CustomView: UIView {
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        let semiCirclesPath = RecieptController.pathSemiCirclesPathForView(givenView: self)
//        UIColor.blue.setFill()
//        UIColor.black.setStroke()
//        
//        semiCirclesPath.fill()
//        semiCirclesPath.stroke()
//    }
}
