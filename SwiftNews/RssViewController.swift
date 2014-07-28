//
//  RssViewController.swift
//  SwiftNews
//
//  Created by PxP_ss on 2014/07/26.
//  Copyright (c) 2014年 A.Akira. All rights reserved.
//

import UIKit

class RssViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let iv:UIImageView = UIImageView(image:UIImage(named:"swift"))
    
    var rss : NSArray = ["Swiftでは配列の型が確定しないとfor inは扱えない(気がする)", "test2", "test3", "test4", "test5"];
    var urls     : NSMutableArray = NSMutableArray()
    var rssItems : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController.navigationBar.barTintColor = .orangeColor()
        
        initAnimation()
        
        var getArticle = GetArticle()
        rssItems = getArticle.getArticle()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initAnimation(){
        let launch_img:UIImage = UIImage(named: "Swift_sprash")
        let launch_iv:UIImageView = UIImageView(image:launch_img);
        launch_iv.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
        self.navigationController.view.addSubview(launch_iv)
        
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
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return rssItems.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let id   = "CustomCell";
        var cell = self.tableView.dequeueReusableCellWithIdentifier(id, forIndexPath:indexPath) as CustomCell
        
        var imageName = NSString()
        
        if (indexPath.row % 3 == 0){
            imageName = "icon01.png"
        }
        else if (indexPath.row % 3 == 1){
            imageName = "icon02.png"
        }
        else {
            imageName = "icon03.png"
        }
        
        cell.tag = indexPath.row
        
        // なぜかarticleUrlにアクセスできない
        //urls.addObject(rssItems[indexPath.row].articleUrl)
//        urls.addObject("http://qiita.com/yukihamada/items/9b0067f905418105a2c6" as NSString)
        var item:QiitaItem = rssItems[indexPath.row] as QiitaItem
        urls.addObject(item.articleUrl)
        
        var title:NSString = rssItems[indexPath.row].title      as NSString
        
        // なぜかstockCountにアクセスできない
        // var cnt:NSString   = rssItems[indexPath.row].stockCount as NSString
        var cnt = String(indexPath.row)
        
        println("--------------------------")
        println(rssItems[indexPath.row])
        
        cell.configureCell(imageName, title: title, stock: cnt)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "WebViewForSegue"){
            let nextViewController: WebViewController = segue.destinationViewController as WebViewController
            nextViewController.strUrl = urls[sender.tag] as NSString
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

