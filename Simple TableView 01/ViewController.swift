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
        myCell.textLabel?.text = animals[myRow]
        myCell.detailTextLabel?.text = year[myRow]
        return myCell
    }

    

}

