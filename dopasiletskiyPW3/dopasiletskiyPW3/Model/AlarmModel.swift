//
//  AlarmModel.swift
//  dopasiletskiyPW3
//
//  Created by Даниил Пасилецкий on 19.10.2021.
//

class AlarmModel{
    var min: Int
    var isActive: Bool
    
    init(min: Int, isActive: Bool ) {
        self.isActive = isActive
        self.min = min
    }
    
    static var alarms: [AlarmModel] = randomAlarms()
    
    static func randomAlarms() -> [AlarmModel]{
        var al: [AlarmModel] = []
        for _ in 0...200 { al.append(
            AlarmModel(
                min: Int.random(in: 0...1440),
                isActive: Bool.random()
            )
        )
        }
        return al
    }
    
    
}
