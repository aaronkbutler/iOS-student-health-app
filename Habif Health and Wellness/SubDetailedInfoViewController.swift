//
//  SubDetailedInfoViewController.swift
//  Habif Health and Wellness
//
//  Created by Coby Drexler on 11/16/19.
//  Copyright © 2019 Aaron Butler. All rights reserved.
//

import UIKit

class SubDetailedInfoViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
    var header: String!
    var infoDetail: InfoViewController.InfoDetail!

    @IBOutlet weak var mission: UITextView!
    @IBOutlet weak var subDetailTable: UITableView!
    @IBOutlet weak var headline: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        mission.text = infoDetail.mission
        headline.text = header
        navigationItem.title = infoDetail.headline
    }

    func setupTableView() {
        subDetailTable.dataSource = self
        subDetailTable.delegate = self
        subDetailTable.register(UITableViewCell.self, forCellReuseIdentifier: "infoCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoDetail.subservices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "infoCell")
        cell.textLabel!.text = infoDetail.subservices[indexPath.row]
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showInfo", sender: infoDetail.subservices[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let moreInfoVC = segue.destination as! MoreInformationViewController
        let infoKey = sender as! String
        let info = infoDetail.subserviceMap[infoKey]

        moreInfoVC.infoToDetail = info
        moreInfoVC.header = header
        moreInfoVC.navTitle = infoKey
    }

}
