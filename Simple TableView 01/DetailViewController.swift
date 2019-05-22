//
//  DetailViewController.swift
//  Simple TableView 01
//
//  Created by D7702_10 on 2019. 5. 22..
//  Copyright © 2019년 D7702_10. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    // ViewController의 배열 데이터를 받는 변수 선언
    var dataLabel : String?
    var dataImage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        myLabel.text = dataLabel
//        myImageView.image = UIImage(named : dataImage!)
    }
    

    // dismiss = 돌아가기
    @IBAction func backToViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveData(_ sender: Any) {
        myLabel.text = "Data Saved"
    }
    
    
}
