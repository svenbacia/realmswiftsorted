//
//  Item.swift
//  RealmSwiftSorted
//
//  Created by Sven Bacia on 26/05/15.
//  Copyright (c) 2015 Sven Bacia. All rights reserved.
//

import UIKit
import RealmSwift

class Item: Object {
  
  dynamic var uuid = NSUUID().UUIDString
  dynamic var name: String = ""
  
  override class func primaryKey() -> String? {
    return "uuid"
  }
}
