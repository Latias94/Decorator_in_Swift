//
//  Purchase.swift
//  Decorator
//
//  Created by 猫冬 on 2017/2/20.
//  Copyright © 2017年 Frankorz. All rights reserved.
//

import Foundation

// CustomStringConvertible 作用是整理控制台的输出
class Purchase : CustomStringConvertible {
  fileprivate let product:String;
  fileprivate let price:Float;
  
  init(product:String, price:Float) {
    self.product = product;
    self.price = price;
  }
  
  var description:String {
    return product;
  }
  
  var totalPrice:Float {
    return price;
  }
}

