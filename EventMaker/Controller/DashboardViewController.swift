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
   
    private let cellIdentifier = "dashboardIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        dashboaardTableView.delegate = self
        dashboaardTableView.dataSource = self
        
        tabBarController?.tabBar.items?.last?.image = #imageLiteral(resourceName: "ic_evento_over")
    }

}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DashboardTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if (section == 0){
            return "Meus eventos"
        }
        if (section == 1){
            return "Eventos cancelados"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }
    
    
}
