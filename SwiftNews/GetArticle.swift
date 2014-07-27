//
//  GetArticle.swift
//  SwiftNews
//
//  Created by PxP_ss on 2014/07/27.
//  Copyright (c) 2014年 A.Akira. All rights reserved.
//

import Foundation

class GetArticle : NSObject, NSURLConnectionDelegate  {
    var articleArray: NSMutableArray = []
    
    func getArticle() -> NSMutableArray {
        let url = NSURL.URLWithString("https://qiita.com/api/v1/search?q=swift")
        let request = NSURLRequest(URL: url)
        
        let connection = NSURLConnection.connectionWithRequest(request, delegate:self)
        let res = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)?
        
        /*
        // resが帰ってこなかった場合、リクエストを再度送る処理を書きたかった
        if (!res){
            sleep(5)
            return self.getArticle()
        }
        */
        
        let json: NSArray? = NSJSONSerialization.JSONObjectWithData(res as NSData, options:NSJSONReadingOptions.AllowFragments, error: nil) as? NSArray
        
        
        if (!json){
            return articleArray
        }
        
        var userObject: QiitaItem = QiitaItem()
        for obj in json! {
            println("----------------------------")
            userObject = QiitaItem()
            if let userName:NSString = (((obj as? NSDictionary)?["user"] as? NSDictionary)?["name"] as? NSString)? {
                userObject.userName = userName
                println("userName:" + userName)
            }
            if let title:NSString = ((obj as? NSDictionary)?["title"] as? NSString)? {
                userObject.title = title
                println("title:" + title)
            }
            if let stock:NSString = ((obj as? NSDictionary)?["stock_count"] as? NSString)? {
                userObject.stockCount = stock
                println("stock:" + stock)
            }
            if let url:NSString = ((obj as? NSDictionary)?["url"] as? NSString)? {
                userObject.articleUrl = url
                println("articleURL:" + url)
            }
            if let created_at_in_words:NSString = ((obj as? NSDictionary)?["created_at_in_words"] as? NSString)? {
                userObject.date = created_at_in_words
                println("date:" + created_at_in_words)
            }
            articleArray.addObject(userObject)
        }
        
        println("----------------------------")
        println(articleArray)
        
        return articleArray
    }
    
    func connection(connection: NSURLConnection!, canAuthenticateAgainstProtectionSpace protectionSpace: NSURLProtectionSpace!) -> Bool
    {
        var urlFlag = false
        if (protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust){
            urlFlag = true
        }
        return urlFlag
    }
}