//
//  Options.swift
//  Decorator
//
//  Created by 猫冬 on 2017/2/20.
//  Copyright © 2017年 Frankorz. All rights reserved.
//

import Foundation

/// 装饰器
class BasePurchasDecorator : Purchase {
  private let wrappedPurchase: Purchase
  
  init(purchase: Purchase) {
    wrappedPurchase = purchase
    super.init(product: purchase.description, price: purchase.totalPrice)
  }
}

/// 礼品包装
class PurchaseWithGiftWrap : BasePurchasDecorator {
  override var description: String {
    return "\(super.description) + giftwrap"
  }
  
  override var totalPrice: Float {
    return super.totalPrice + 2
  }
}

// 礼带
class PurchaseWithRibbon : BasePurchasDecorator {
  override var description: String {
    return "\(super.description) + ribbon"
  }
  
  override var totalPrice: Float {
    return super.totalPrice + 1
  }
}

/// 礼品配送
class PurchaseWithDelivery : BasePurchasDecorator {
  override var description: String {
    return "\(super.description) + delivery"
  }
  
  override var totalPrice: Float {
    return super.totalPrice + 5
  }
}

/// 合并装饰器
class GiftOptionDecorator: Purchase {
  private let wrappedPurchase: Purchase
  private let options: [Option]
  
  enum Option {
    case giftWrap
    case ribbon
    case delivery
  }
  
  init(purchase: Purchase, options: [Option]) {
    self.wrappedPurchase = purchase
    self.options = options
    super.init(product: purchase.description, price: purchase.totalPrice)
  }
  
  override var description: String {
    var result = wrappedPurchase.description
    for option in options {
      switch option {
      case .giftWrap:
        result = "\(result) + giftwrap"
      case .ribbon:
        result = "\(result) + ribbon"
      case .delivery:
        result = "\(result) + delivery"
      }
    }
    return result
  }
  
  override var totalPrice: Float {
    var result = wrappedPurchase.totalPrice
    for option in options {
      switch option {
      case .giftWrap:
        result += 2
      case .ribbon:
        result += 1
      case .delivery:
        result += 5
      }
    }
    return result
  }
}
