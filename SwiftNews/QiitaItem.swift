//
//  QiitaItem.swift
//  SwiftNews
//
//  Created by akira on 2014/07/26.
//  Copyright (c) 2014年 A.Akira. All rights reserved.
//

import Foundation
class QiitaItem : NSObject {
  
  var title: String {
    get {
      return self.title
    }
    set {
      self.title = newValue
    }
  }
  var preview: String {
    get {
      return self.preview
    }
    set {
      self.preview = newValue
    }
  }
  var userName: String {
    get {
      return self.userName
    }
    set {
      self.userName = newValue
    }
  }
  var userIcon: String {
    get {
      return self.userIcon
    }
    set {
      self.userIcon = newValue
    }
  }
  var createdDate: String {
    get {
      return self.createdDate
    }
    set {
      self.createdDate = newValue
    }
  }
  var stockCount: String {
    get {
      return self.stockCount
    }
    set {
      self.stockCount = newValue
    }
  }

}