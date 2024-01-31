//
//  ViewController.swift
//  Phone App
//
//  Created by Ömer Özyılmaz on 31.01.2024.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var directory:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TableView
        directoryTableView.dataSource = self
        directoryTableView.delegate = self
        
        directory = ["Sila", "Mahmut", "Aleyna", "Cihan", "O"]
    }

    @IBOutlet weak var directoryTableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return directory.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
        cell.textLabel?.text = directory[indexPath.row]
        return cell
    }
        
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteSwipeAction = UIContextualAction(style: .destructive, title: "Delete"){
            (UIContextualAction, view, boolValue) in
            
            self.directoryTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return UISwipeActionsConfiguration(actions: [deleteSwipeAction])
    
    }
    
}

