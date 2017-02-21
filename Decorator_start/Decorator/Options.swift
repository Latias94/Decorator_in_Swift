//
//  Options.swift
//  Decorator
//
//  Created by 猫冬 on 2017/2/20.
//  Copyright © 2017年 Frankorz. All rights reserved.
//

import Foundation

/// 礼品包装
class PurchaseWithGiftWrap : Purchase {
  override var description: String {
    return "\(super.description) + giftwrap"
  }
  
  override var totalPrice: Float {
    return super.totalPrice + 2
  }
}

// 礼带
class PurchaseWithRibbon : Purchase {
  override var description: String {
    return "\(super.description) + ribbon"
  }
  
  override var totalPrice: Float {
    return super.totalPrice + 1
  }
}

/// 礼品配送
class PurchaseWithDelivery : Purchase {
  override var description: String {
    return "\(super.description) + delivery"
  }
  
  override var totalPrice: Float {
    return super.totalPrice + 5
  }
}

