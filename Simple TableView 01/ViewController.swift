//
//  ViewController.swift
//  Simple TableView 01
//
//  Created by D7702_10 on 2019. 5. 8..
//  Copyright © 2019년 D7702_10. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    var animals = ["Cat", "Horse", "Pig", "Dog", "Bird"]
    var year = ["3", "5", "2", "6", "2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Delegate 객체와 ViewController의 연결
        myTableView.dataSource = self
        myTableView.delegate = self
        
        // navigationBar title 설정
        self.title = "동물농장"
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
        
        // cell에 image 삽입
        myCell.imageView?.image = UIImage(named: animals[myRow])
        return myCell
    }

    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
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

    
    // UITableViewDelegate 메소드
    // cell 크기 조절
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }

    
    // 배열에 있는 데이터 DetailViewController에 넘겨주기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "godetail" {
            
//            let dvController = segue.destination as! DetailViewController
//            dvController.dataLabel = animals[2]
//            dvController.dataImage = animals[2]
            
            
        } else if segue.identifier == "gocell" {
            
            let dcController = segue.destination as! DetailCellViewController
            let myIndexPath = myTableView.indexPathForSelectedRow
            let myRow = myIndexPath?.row
            dcController.cellData = animals[myRow!]
            dcController.cellImage = animals[myRow!]
            
            
        } else if segue.identifier == "godetailcell" {
            
            let dtController = segue.destination as! myTableViewController
            let myIndexPath = myTableView.indexPathForSelectedRow
            let myRow = myIndexPath?.row
            dtController.detailAnimals = animals[myRow!]
            dtController.detailYear = year[myRow!]
            
            
        } else {
            fatalError()
        }
    }
    
    
    
}

