//
//  ViewController.swift
//  ZHFLongImageLeftRightMove
//
//  Created by 张海峰 on 2018/4/12.
//  Copyright © 2018年 张海峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let ScreenHeight = UIScreen.main.bounds.size.height
    let ScreenWidth = UIScreen.main.bounds.size.width
    let time :NSInteger = 5 //循环一次的时间
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var backGroundViewH: NSLayoutConstraint!
    var imageView1:UIImageView!
    var imageW : CGFloat = 0;
    var x1: CGFloat = 0{
        didSet{
            if x1 == ScreenWidth {
                UIView.animate(withDuration: TimeInterval(time), animations: {
                    self.imageView1.frame = CGRect.init(x: self.ScreenWidth - self.imageW, y: 0, width:  self.imageW, height: self.backGroundViewH.constant)
                }) { (_) in
                    self.x2 = self.ScreenWidth
                }
            }
        }
    }
    var x2: CGFloat = 0{
        didSet{
            if x2 ==  ScreenWidth {
                UIView.animate(withDuration: TimeInterval(time), animations: {
                    self.imageView1.frame = CGRect.init(x: 0, y:0, width:  self.imageW, height:  self.backGroundViewH.constant)
                }) { (_) in
                    self.x1 = self.ScreenWidth
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundViewH.constant = ScreenHeight
        let image:UIImage = UIImage.init(named: "longImage")!
        imageW = image.size.width/image.size.height * backGroundViewH.constant
        imageView1 = UIImageView.init(frame: CGRect.init(x: 0, y:0, width: imageW, height: backGroundViewH.constant))
        imageView1.image = image
        backGroundView.addSubview(imageView1)
        backGroundView.sendSubview(toBack: imageView1)
        let alphaView : UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: imageW, height: self.backGroundViewH.constant))
        alphaView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.1)
        imageView1.addSubview(alphaView)
        UIView.animate(withDuration: TimeInterval(time), animations: {
            self.imageView1.frame = CGRect.init(x: self.ScreenWidth - self.imageW, y: 0, width:  self.imageW, height: self.backGroundViewH.constant)
        }) { (_) in
            self.x2 = self.ScreenWidth
        }
    }
}

