//
//  ViewController.swift
//  SwiftNews
//
//  Created by akira on 2014/07/26.
//  Copyright (c) 2014年 A.Akira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let iv:UIImageView = UIImageView(image:UIImage(named: "swift"))
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib
    initAnimation()
    let hoge = GetArticle()
    hoge.getArticle()

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
    func initAnimation(){
        
        let launch_img:UIImage = UIImage(named: "Swift_sprash")
        let launch_iv:UIImageView = UIImageView(image:launch_img);
        launch_iv.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        self.view.addSubview(launch_iv)
        
        
        
        iv.frame = CGRectMake(-iv.bounds.width, self.view.bounds.height/2, 50, 50)
        launch_iv.addSubview(iv)
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {() -> Void in
            let movePoint = CGPointMake(self.view.bounds.width - 25, self.view.bounds.height/2)
            self.iv.center = movePoint
            }, completion: {(Bool) -> Void in
                UIView.animateWithDuration(1, animations: {() -> Void in
                    
                    let movePoint = CGPointMake(self.view.bounds.width*2, self.view.bounds.height/2)
                    launch_iv.center = movePoint
                    }, completion: {(Bool) -> Void in
                        
                        
                    })
            })
    }


}

