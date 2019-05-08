//
//  ViewController.swift
//  Simple TableView 01
//
//  Created by D7702_10 on 2019. 5. 8..
//  Copyright © 2019년 D7702_10. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    var animals = ["Cat", "Horse", "Pig", "Whale", "Dog", "Bird"]
    var year = ["3", "5", "2", "6", "8", "2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Delegate 객체와 ViewController의 연결
        myTableView.dataSource = self
    }

    // UITableViewDataSource Delegate 메소드
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return animals.count
    }

    // cell 생성, 메모리 풀(cell identifier)을 검사하여
    // 있으면 재활용
    // 없으면 새로 생성
    // 다음 재활용을 위해 메모리 풀에 저장
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let myRow = indexPath.row
        let mySection = indexPath.section
        myCell.textLabel?.text = animals[myRow]
        // myCell.detailTextLabel?.text = year[myRow]
        myCell.detailTextLabel?.text = "section = \(mySection) row = \(myRow)"
        return myCell
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    } // Default is 1 if not implemented

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "section header \(section)"
        } else {
            return "section header \(section)"
        }
    } // fixed font style. use custom view (UILabel) if you want something different

    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        if section == 0 {
            return "section footer \(section)"
        } else {
            return "section footer \(section)"
        }
    }

    
}

