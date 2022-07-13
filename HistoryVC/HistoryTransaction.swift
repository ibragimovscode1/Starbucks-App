//
//  HistoryTransaction.swift
//  Starbucks App
//
//  Created by Rahmetullah on 13.07.2022.
//


import Foundation

/*
 let json = """
 {
 "transactions": [
   {
     "id": 699519475,
     "type": "redeemed",
     "amount": "150",
     "processed_at": "2020-07-17T12:56:27-04:00"
   }
  ]
 }
 """
 */

struct History: Codable {
    let transactions: [Transaction]
}

struct Transaction: Codable {
    let id: Int
    let type: String
    let amount: String
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case amount
        case date = "processed_at"
    }
}
