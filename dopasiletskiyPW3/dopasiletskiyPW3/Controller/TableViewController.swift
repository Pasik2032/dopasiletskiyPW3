//
//  TableViewController.swift
//  dopasiletskiyPW3
//
//  Created by Даниил Пасилецкий on 14.10.2021.
//

import UIKit

class TableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green

        AlarmModel.alarms.sort(by: {$0.min < $1.min})
        setupTableView()
    } 
    
    public var tableView: UITableView!
    let cellId = "eyeCell"

    
    private func setupTableView() {
        tableView = UITableView(frame: view.frame)
        tableView.register(EyeCell.self.self, forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        tableView.showsVerticalScrollIndicator = true
        tableView.translatesAutoresizingMaskIntoConstraints = false //
        tableView.layer.masksToBounds = true
        
        self.view.addSubview(tableView)
    }
    
    
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
                    section: Int) -> Int {
        AlarmModel.alarms.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let secondViewController = EditViewController()
        secondViewController.index = indexPath.row
        navigationController?.pushViewController(secondViewController,animated: true)
        }
    
    
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
                    IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellId,
            for: indexPath
        ) as? EyeCell
        cell?.setupEye()
        cell?.swich.isOn = AlarmModel.alarms[indexPath.row].isActive
        cell?.distanceLabel.text = String(AlarmModel.alarms[indexPath.row].min / 60) + ":" + String(AlarmModel.alarms[indexPath.row].min % 60)
        cell?.swich.tag = indexPath.row
        cell?.swich.addTarget(self, action: #selector(alarmIsOn),  for: .valueChanged)
        return cell ?? UITableViewCell()
    }
    
    @objc
   func alarmIsOn(_ sender: UISwitch) {
       if(sender.isOn){
           AlarmModel.alarms[sender.tag].isActive = true
       } else{
           AlarmModel.alarms[sender.tag].isActive = false
       }
   }
    
}


