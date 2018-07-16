//
//  ViewController.swift
//  WindowsTest
//
//  Created by hans on 2018/7/13.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import SnapKit
import SwiftRandom
import RandomKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
let tableView = UITableView(frame: .zero, style: .plain)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let ns = UILabel()
//        ns.te
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 1
        tableView.backgroundColor = UIColor.green
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(Randoms.randomInt32(5, 50))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.numberOfLines = 0
        let randomInt = Int.random(in: -100 ... 100, using: &ARC4Random.default)
        cell?.textLabel?.text = String(format:"%d",indexPath.row) + "   " + Randoms.randomString(withCharactersInString: "abcqwertyuuff", minimumLength: 12, maximumLength: 456)
 
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MyViewController()
        self.present(vc, animated: true) {
            
        }
    }

}

