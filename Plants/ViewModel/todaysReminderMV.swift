import Foundation
import Combine
import SwiftData


class todaysReminderMV : ObservableObject{
    
    func title (in plants: [PlantsData]) -> String {
        var text: String
        if reminderCount(in: plants) > 0 {
            text = "\(CheckedCount(in: plants)) of your plants feel loved today✨"
        }
        else {
            text = "Your plants are waiting for a sip 💦"
        }
        return text
    }
    
    func reminderCount (in plants: [PlantsData]) -> Int{ // return number of reminders
        plants.count
        
    }
    func ProgressCount (in plants: [PlantsData]) -> Float { // return number of progress percentage bar
        guard !plants.isEmpty else { return 0 }
        return Float(CheckedCount(in: plants)) / Float(plants.count)
        
    }
    func CheckedCount(in plants: [PlantsData]) -> Int { // return number of reminders that has been checked
        return plants.filter { $0.isChecked }.count
    }
    
}
// plant.count for # of reminders
//plants.filter { $0.isChecked }.count # of check reminders
//plants.filter { $0.isChecked }.count - plant count # of unchecked reminders
