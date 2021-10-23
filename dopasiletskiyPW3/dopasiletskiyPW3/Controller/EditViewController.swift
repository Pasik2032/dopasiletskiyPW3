//
//  EditViewController.swift
//  dopasiletskiyPW3
//
//  Created by Даниил Пасилецкий on 20.10.2021.
//

import UIKit

class EditViewController: ViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if(index == nil){
            setupTextFiled()
        } else {
            // Specify date components
            var dateComponents = DateComponents()
          //  dateComponents.year = 1980
         //   dateComponents.month = 7
          //  dateComponents.day = 11
         //   dateComponents.timeZone = TimeZone(abbreviation: "JST") // Japan Standard Time
            dateComponents.hour = AlarmModel.alarms[index!].min / 60
            dateComponents.minute = AlarmModel.alarms[index!].min % 60
           
            // Create date from components
            let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 1980) are for Gregorian
            let someDateTime = userCalendar.date(from: dateComponents)
            print(someDateTime!)
            datePiked.date = someDateTime!
            setupTextFiled2()
        }
        
    }
    
    public var index: Int?
    public var vc: ViewController?
    
    
    let datePiked = UIDatePicker()
    
    func setupTextFiled(){
        
        let label = UITextView()
        let button = UIButton()
        button.frame = CGRect(x: UIScreen.main.bounds.width/2-20, y: UIScreen.main.bounds.height - 200, width: 100, height: 40)
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        label.frame = CGRect(x: 100, y: 300, width: 100, height: 40)
        label.text = "Время: "
        label.font = UIFont.systemFont(ofSize: 25)
        datePiked.datePickerMode = .time
        datePiked.frame = CGRect(x: 250, y: 310, width: 300, height: 40)
        self.view.addSubview(button)
        self.view.addSubview(datePiked)
        self.view.addSubview(label)
        
    }
    @objc func buttonAction(sender: UIButton!) {
        let calendar = Calendar.current
        let date = datePiked.date
        // *** Get components using current Local & Timezone ***
        print(calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date))

        // *** define calendar components to use as well Timezone to UTC ***
//        calendar.timeZone = TimeZone(identifier: "UTC")!

        // *** Get All components from date ***
        let components = calendar.dateComponents([.hour, .year, .minute], from: date)
        print("All Components : \(components)")

        // *** Get Individual components from date ***
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let min = ((hour)*60) + minutes
        print(min)
        AlarmModel.alarms.append(AlarmModel(min: min, isActive: false))
        AlarmModel.alarms.sort(by: {$0.min < $1.min})
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func setupTextFiled2(){
        
        let label = UITextView()
        let button = UIButton()
        button.frame = CGRect(x: UIScreen.main.bounds.width/2-20, y: UIScreen.main.bounds.height - 200, width: 100, height: 40)
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        label.frame = CGRect(x: 100, y: 300, width: 100, height: 40)
        label.text = "Время: "
        label.font = UIFont.systemFont(ofSize: 25)
        datePiked.datePickerMode = .time
        datePiked.frame = CGRect(x: 250, y: 310, width: 300, height: 40)
        self.view.addSubview(button)
        self.view.addSubview(datePiked)
        self.view.addSubview(label)
        
    }
    @objc func buttonAction2(sender: UIButton!) {
        let calendar = Calendar.current
        let date = datePiked.date
        // *** Get components using current Local & Timezone ***
        print(calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date))

        // *** define calendar components to use as well Timezone to UTC ***
//        calendar.timeZone = TimeZone(identifier: "UTC")!

        // *** Get All components from date ***
        let components = calendar.dateComponents([.hour, .year, .minute], from: date)
        print("All Components : \(components)")

        // *** Get Individual components from date ***
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let min = ((hour)*60) + minutes
        print(min)
        AlarmModel.alarms[index!].min = min
        AlarmModel.alarms.sort(by: {$0.min < $1.min})
//        navigationController?.pushViewController(TableViewController(), animated: true)
        self.navigationController?.popViewController(animated: true)
        let a = (tabBarController?.viewControllers?[1]) as? TableViewController
        a?.tableView.reloadData()
    }
    
    
    
}
