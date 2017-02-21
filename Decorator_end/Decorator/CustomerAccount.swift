//
//  CustomerAccount.swift
//  Decorator
//
//  Created by 猫冬 on 2017/2/20.
//  Copyright © 2017年 Frankorz. All rights reserved.
//

import Foundation

class CustomerAccount {
  let customerName:String;
  var purchases = [Purchase]();
  
  init(name:String) {
    self.customerName = name;
  }
  
  func addPurchase(_ purchase:Purchase) {
    self.purchases.append(purchase);
  }
  
  func printAccount() {
    var total:Float = 0;
    for purchase in purchases {
      total += purchase.totalPrice;
      print("Purchase \(purchase), Price \(formatCurrencyString(purchase.totalPrice))");
    }
    print("Total due: \(formatCurrencyString(total))");
  }
  
  func formatCurrencyString(_ number:Float) -> String {
    let formatter = NumberFormatter();
    formatter.numberStyle = NumberFormatter.Style.currency;
    return formatter.string(from: NSNumber(value: number)) ?? "";
  }
}

