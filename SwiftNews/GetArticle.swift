//
//  GetArticle.swift
//  SwiftNews
//
//  Created by akira on 2014/07/26.
//  Copyright (c) 2014年 A.Akira. All rights reserved.
//

import UIKit

class GetArticle : NSObject {
  
  let QIITA_URL = "https://qiita.com/"
  let GET_SEARCH = "api/v1/search?q=swift"
  
  let TAG_TITLE = "title"
  let TAG_DATE = "created_at_in_words"
  let TAG_ARTICLE_URL = "url"
  let TAG_STOCK_COUNT = "stock_count"
  
  let TAG_USER = "user"
  let TAG_USER_NAME = "url_name"
  
  var articleArray: NSMutableArray = []
  
  func getArticle() -> NSMutableArray {
    let url = NSURL(string: QIITA_URL + GET_SEARCH)
    let request = NSURLRequest(URL: url)
    let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
    
    let ret = NSString(data:data, encoding:NSUTF8StringEncoding)
    
    let json: NSArray = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.AllowFragments, error: nil) as NSArray
    
    var userObject: QiitaItem = QiitaItem()
    for var i=0; i<json.count; i++ {
      if let obj: AnyObject = json[i]? {
        if let objDic = obj as? [String: AnyObject] {
          if let user = objDic[TAG_USER] {
            if let name = objDic[TAG_USER_NAME] {
              NSLog("\(name)")
              userObject.userName = name as String
            }
          }
          if let title: String = objDic[TAG_TITLE] as? NSString {
            NSLog("\(title)")
            userObject.title = title
          }
          if let url: String = objDic[TAG_ARTICLE_URL] as? NSString {
            NSLog("\(url)")
            userObject.articleUrl = url
          }
          if let date: String = objDic[TAG_DATE] as? NSString {
            NSLog("\(date)")
            userObject.date = date
          }
          if let count: String = objDic[TAG_STOCK_COUNT] as? NSString {
            NSLog("\(count)")
            userObject.stockCount = count
          }
        }
        println()
        articleArray.addObject(userObject)
      }
    }
    return articleArray
  }
}
