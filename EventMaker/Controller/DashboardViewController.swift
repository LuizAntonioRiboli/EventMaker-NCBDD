//
//  DashboardViewController.swift
//  EventMaker
//
//  Created by Annderson Packeiser Oreto on 03/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var dashboaardTableView: UITableView!
   
    private let cellIdentifier = "dashboardCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: "xibTableViewCell", bundle: nil)

        dashboaardTableView.register(xib, forCellReuseIdentifier: cellIdentifier)
        // Do any additional setup after loading the view.
        dashboaardTableView.delegate = self
        dashboaardTableView.dataSource = self
    }

}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DashboardTableViewCell
        
        return cell
    }
    
    
}
