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
  let URL = "https://qiita.com/api/v1/search?q=swift"
  
  let TAG_ARTICLE_URL = "url"
  let TAG_TITLE = "title"
  let TAG_BODY = "body"
  let TAG_STOCK_COUNT = "stock_count"
  
  let articleArray: [String] = []

  func getArticle() {
    let url = NSURL(string: QIITA_URL + GET_SEARCH)
    let request = NSURLRequest(URL: url)
    let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
    
    let ret = NSString(data:data, encoding:NSUTF8StringEncoding)

    let json = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.AllowFragments, error: nil) as NSArray
    
    
    println(json[0].objectForKey("user").objectForKey("url_name"))
//    println(json[0]["user"]["url_name"])
  }
}
