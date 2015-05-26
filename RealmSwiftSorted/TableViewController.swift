//
//  TableViewController.swift
//  RealmSwiftSorted
//
//  Created by Sven Bacia on 26/05/15.
//  Copyright (c) 2015 Sven Bacia. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  var items: Results<Item>! {
    didSet {
      sortedResult = sorted(items, { $0.name.localizedCompare($1.name) == NSComparisonResult.OrderedAscending })
    }
  }
  var sortedResult: [Item]!
  
  // MARK: - ViewController Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    items = Realm().objects(Item).sorted("name", ascending: true)
    
    navigationController?.toolbarHidden = false
  }
  
  // MARK: - IBAction's
  
  @IBAction func segmentedControlValueChanged(sender: UISegmentedControl) {
    tableView.reloadData()
  }
  
  // MARK: - Table view data source
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return segmentedControl.selectedSegmentIndex == 0 ? items.count : sortedResult.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    cell.textLabel?.text = segmentedControl.selectedSegmentIndex == 0 ? items[indexPath.row].name : sortedResult[indexPath.row].name
    return cell
  }
}
