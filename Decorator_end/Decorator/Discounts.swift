//
//  Discounts.swift
//  Decorator
//
//  Created by 猫冬 on 2017/2/20.
//  Copyright © 2017年 Frankorz. All rights reserved.
//

import Foundation

/// 新增了折扣功能的装饰器
class DiscountDecorator: Purchase {
  private let wrappedPurchase: Purchase
  
  init(purchase: Purchase) {
    self.wrappedPurchase = purchase
    super.init(product: purchase.description, price: purchase.totalPrice)
  }
  
  override var description: String {
    return super.description
  }
  
  /// 优惠了多少元
  var discountAmount: Float {
    return 0
  }
  
  /// 判断产品是否适用折扣优惠
  func countDiscounts() -> Int {
    var total = 1
    // 注意这里对象本身就已经是一个折扣，wrappedPurchase 是折扣后跟着的purchase对象，还是折扣的话折扣数+1
    if let discounter = wrappedPurchase as? DiscountDecorator {
      total += discounter.countDiscounts()
    }
    return total
  }
}

/// 黑色星期五打8折
class BlackFridayDecorator: DiscountDecorator {
  override var totalPrice: Float {
    return super.totalPrice - discountAmount
  }
  
  override var discountAmount: Float {
    return super.totalPrice * 0.20
  }
}

/// 清仓大甩卖打3折
class EndOfLineDecorator: DiscountDecorator {
  override var totalPrice: Float {
    return super.totalPrice - discountAmount
  }
  
  override var discountAmount: Float {
    return super.totalPrice * 0.70
  }
}
