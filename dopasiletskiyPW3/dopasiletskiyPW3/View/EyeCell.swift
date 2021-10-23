//
//  EyeCell.swift
//  dopasiletskiyPW3
//
//  Created by Даниил Пасилецкий on 19.10.2021.
//
import UIKit
final class EyeCell: UITableViewCell {
    
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
    
    func setupEye() {
        addSubview(distanceLabel)
        addSubview(swich)
        swich.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        swich.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        distanceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
    }
    
    override func prepareForReuse() {
        for subview in subviews {
            if subview is UIImageView {
                subview.removeFromSuperview()
            }
        }
    }
}

