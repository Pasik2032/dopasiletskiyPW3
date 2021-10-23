//
//  AlarmView.swift
//  dopasiletskiyPW3
//
//  Created by Даниил Пасилецкий on 20.10.2021.
//

import UIKit

class AlarmView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white //black
        addSubview(distanceLabel)
        addSubview(swich)
        swich.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        swich.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        distanceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let distanceLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 25)
        control.textColor = UIColor.black //lightGray
        control.text = "00 : 00"
        control.translatesAutoresizingMaskIntoConstraints = false // required
        return control
    }()
    
    let swich: UISwitch = {
        let control = UISwitch()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    func addView() {
        
    }

}
