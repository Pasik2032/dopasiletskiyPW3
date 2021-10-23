//
//  StackViewController.swift
//  dopasiletskiyPW3
//
//  Created by Даниил Пасилецкий on 14.10.2021.
//

import UIKit

class StackViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        createStackView()
        
    }
    
    fileprivate func AddStack(_ stack: UIStackView) {
        AlarmModel.alarms.sort(by: {$0.min < $1.min})
        var count = 0
        for iteam in AlarmModel.alarms {
            let a = AlarmView()
            a.distanceLabel.text = String(iteam.min / 60) + ":" + String(iteam.min % 60)
            a.swich.isOn = iteam.isActive
            a.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
            a.heightAnchor.constraint(equalToConstant: 80).isActive = true
            a.swich.tag = count
            a.swich.addTarget(self, action: #selector(alarmIsOn),  for: .valueChanged)
            stack.addArrangedSubview(a)
            count += 1
        }
    }
    
    @objc
    func alarmIsOn(_ sender: UISwitch) {
        if(sender.isOn){
            AlarmModel.alarms[sender.tag].isActive = true
        } else{
            AlarmModel.alarms[sender.tag].isActive = false
        }
    }
    var stack = UIStackView()
    let scroll = UIScrollView()
    func createStackView(){
        stack.frame = view.bounds
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.masksToBounds = true
        AddStack(stack)
        self.view.addSubview(stack)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        scroll.heightAnchor.constraint(equalToConstant: view.frame.size.height).isActive = true
        scroll.addSubview(stack)
        self.view.addSubview(scroll)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scroll.contentSize = CGSize(
            width:
                self.scroll.frame.width,
            height: stack.frame.height
        )
    }
    
}
