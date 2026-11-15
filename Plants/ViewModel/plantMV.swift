import Foundation
import Combine
import SwiftData


class plantMV : ObservableObject{
    @Published var Next = false
    @Published var showCover = false
    @Published var name = ""
    @Published var room = "Bedroom"
    @Published var light = "Full sun"
    @Published var water = "20-50 ml"
    @Published var days = "Every day"
    let options = ["Every day", "Every 2 days", "Every 3 days", "one a week" , "Evrey 10 days" , "Every 2 weeks"]
    let options2 = ["Bedroom", "Living Room", "Kitchen", "Balcony" , "Bathroom"]
    let options4 = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    let options3 = [
        (name: "Full sun", icon: "sun.max.fill"),
        (name: "Partial sun", icon: "cloud.sun.fill"),
        (name: "Low light", icon: "cloud.fill")
    ]
    

    func saveReminder(context: ModelContext) {
        let plant = PlantsData(
            name: name,
            room: room,
            light: light,
            water: water,
            days: days,
            isChecked: false //not sure
        
        )
        context.insert(plant)
        let count = (try? context.fetchCount(FetchDescriptor<PlantsData>())) ?? -1
        print("Total in DB: \(count)")
    }
    
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
    
    func deletereminder (plant :[PlantsData], context: ModelContext){
        context.delete(plant[0])

    }
    
   
    
    
    
}
