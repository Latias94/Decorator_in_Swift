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
account.addPurchase(PurchaseWithDelivery(product: "Scarf", price: 20))

account.printAccount()


