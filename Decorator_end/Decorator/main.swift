//
//  main.swift
//  Decorator
//
//  Created by 猫冬 on 2017/2/20.
//  Copyright © 2017年 Frankorz. All rights reserved.
//

import Foundation

let account = CustomerAccount(name: "Joe")
account.addPurchase(Purchase(product: "Red Hat", price: 10))
account.addPurchase(Purchase(product: "Scarf", price: 20))
// 礼品配送服务
//account.addPurchase(PurchaseWithDelivery(product: "Scarf", price: 20))

// 带礼品配送服务的20元围巾
account.addPurchase(
  PurchaseWithDelivery(purchase:
    Purchase(product: "Scarf", price: 20)))

// 带礼品包装和礼品配送服务的25元太阳眼镜
account.addPurchase(
  PurchaseWithDelivery(purchase:
    PurchaseWithGiftWrap(purchase:
      Purchase(product: "Sunglasses", price:25))))

// 带礼品配送+礼品包装服务的12元太阳眼镜共19元，3折加8折后4.56元。
account.addPurchase(
  EndOfLineDecorator(purchase:
    BlackFridayDecorator(purchase:
      PurchaseWithDelivery(purchase:
        PurchaseWithGiftWrap(purchase:
          Purchase(product: "Towel", price: 12))))))

// 带礼品配送+礼品包装服务的12元太阳眼镜共19元，黑五8折只对产品价格有效，之后再打清仓3折后4.98元。
account.addPurchase(
  EndOfLineDecorator(purchase:
    PurchaseWithDelivery(purchase:
      PurchaseWithGiftWrap(purchase:
        BlackFridayDecorator(purchase:
          Purchase(product: "Towel", price: 12))))))

// 利用合并装饰器实现：带礼品配送+礼品包装服务的12元太阳眼镜共19元，3折加8折后4.56元。
account.addPurchase(EndOfLineDecorator(purchase:
  BlackFridayDecorator(purchase:
    GiftOptionDecorator(purchase:
      Purchase(product: "Towel", price: 12),
                        options: [GiftOptionDecorator.Option.giftWrap,
                                  GiftOptionDecorator.Option.delivery]))))

account.printAccount()

// 输出每个商品的折扣数
for purchase in account.purchases {
  if let discountPurchase = purchase as? DiscountDecorator {
    print("\(discountPurchase) has \(discountPurchase.countDiscounts()) discounts")
  } else {
    print("\(purchase) has no discounts")
  }
}
