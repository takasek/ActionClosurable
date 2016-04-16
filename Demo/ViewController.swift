//
//  ViewController.swift
//  ActionClosurable
//
//  Created by Yoshitaka Seki on 2016/04/11.
//  Copyright © 2016年 Yoshitaka Seki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var button: UIButton? = UIButton(frame: CGRect(x: 0,y: 70,width: 100,height: 100))
    var gr: UITapGestureRecognizer? = UITapGestureRecognizer()
    var timer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()

        UIGraphicsBeginImageContextWithOptions(CGSize(width: 20, height: 20), false, 0)
        let contextImg = UIGraphicsGetCurrentContext()
        CGContextSetRGBFillColor(contextImg,1,1,1,1)
        CGContextFillRect(contextImg, CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "title", style: .Plain, closure: { _ in
                print("barButtonItem title")
            }),
            UIBarButtonItem(image: image, style: .Plain, closure: { _ in
                print("barButtonItem image")
            }),
        ]
        button?.setTitle("button", forState: .Normal)
        button?.backgroundColor = UIColor.redColor()
        self.view.addSubview(button!)

        button?.onTap { [weak self] in
            print($0)
            self?.button?.removeFromSuperview()
            self!.button = nil
        }

        button?.on(.TouchDown) {
            print($0)
        }

        self.view.addGestureRecognizer(gr!)
        gr?.onGesture { [weak self] in
            print("gesture!")
            $0.removeTarget(nil, action: nil)
            self!.gr = nil
        }

        var i = 5
        timer = NSTimer.scheduledTimerWithTimeInterval(1, repeats: true) { [weak self] timer in
            print("timer", i)
            i -= 1
            if i <= 0 {
                timer.invalidate()
                self?.timer = nil
            }
        }
    }
}

