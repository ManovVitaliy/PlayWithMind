//
//  ChooseTeamViewController.swift
//  CollectionViewFlowLayoutTest
//
//  Created by user on 5/22/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class ChooseTeamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var chooseTeamTableView: UITableView!
    
    // constants
    private let cellIdentifier = "ChooseTeamTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.chooseTeamTableView.delegate = self
        self.chooseTeamTableView.dataSource = self
        self.chooseTeamTableView.register(UINib(nibName: "ChooseTeamTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.chooseTeamTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) 
        
        return cell
    }
    
}
