//
//  GrammaMinnanoNihongoViewController.swift
//  NihonGO
//
//  Created by Tong Minh Nguyet on 4/28/20.
//  Copyright © 2020 Tong Minh Nguyet. All rights reserved.
//

import UIKit

class GrammaMinnanoNihongoViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var grammaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation(title: "Ngữ pháp Minnano Nihongo")
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        grammaTableView.register(cellType: GrammaTableViewCell.self)
        grammaTableView.dataSource = self
        grammaTableView.delegate = self
        grammaTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = grammaTableView.dequeueReusableCell(cellType: GrammaTableViewCell.self, indexPath: indexPath)
        cell?.nameLabel.text = "Ngữ pháp bài \(indexPath.row + 1)"
        if indexPath.row % 2 == 0 {
            cell?.iconImageView.image = UIImage(named: "ic-sakura")
        } else {
            cell?.iconImageView.image = UIImage(named: "ic-sakura2")
        }
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailGrammaViewController()
        detail.data = indexPath.row + 1
        let navi = UINavigationController(rootViewController: detail)
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            appdelegate.setRootController(vc: navi)
        }
    }

}
