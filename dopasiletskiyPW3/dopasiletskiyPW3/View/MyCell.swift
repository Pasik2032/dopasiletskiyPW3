//
//  MyCell.swift
//  CollectionViewNisWs
//  Created by Dmitry Alexandrov
//
import UIKit

class MyCell: UICollectionViewCell
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
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
        backgroundColor = UIColor.white //black
        addSubview(distanceLabel)
        addSubview(swich)
        swich.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        swich.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        distanceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
    }
        
}
