import Combine
import SwiftData
import Foundation

enum PlantState {
    case empty, allDone, list
}

class PlantVM : ObservableObject{
    //var context: ModelContext?
    @Published var showForm = false
    @Published var plantToEdit: PlantsData?
    //@Published var editingplant: PlantsData?
    @Published var test = false
    
    //@Published var Next = false
    @Published var name = ""
    @Published var room = "Bedroom"
    @Published var light = "Full sun"
    @Published var water = "20-50 ml"
    @Published var days = "Every day"
    
    
    //---------------
    let options = ["Every day", "Every 2 days", "Every 3 days", "Once a week" , "Every 10 days" , "Every 2 weeks"]
    let options2 = ["Bedroom", "Living Room", "Kitchen", "Balcony" , "Bathroom"]
    let options4 = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    let options3 = [(name: "Full sun", icon: "sun.max.fill"),
                    (name: "Partial sun", icon: "cloud.sun.fill"),
                    (name: "Low light", icon: "cloud.fill")]
    //---------------
    
    
    //@Published var allDone: Bool { !plant.isEmpty && doneCount == plants.count }
    
    /*var canSave: Bool {
     !name.trimmingCharacters(in: .whitespaces).isEmpty
     }*/
    
    func Adding() {
        plantToEdit = nil
        name  = ""
        room  = options2[0]
        light = options3[0].name
        water = options4[0]
        days  = options[0]
        showForm = true
    }// لتصفير الداتا قبل البدء بلاضافه
    func editing(_ plant :PlantsData){
        plantToEdit = plant
        name  = plant.name
        room  = plant.room
        light = plant.light
        water = plant.water
        days  = plant.days
        showForm = true
    }
    
    func state(for plants: [PlantsData]) -> PlantState {
        if plants.isEmpty { return .empty }
        if checkedCount(in: plants) == plants.count { return .allDone }
        return .list
    }
    
    
    
    func save(context: ModelContext) {
        showForm = false
        let item = plantToEdit ?? PlantsData(name: name, room: room, light: light, water: water, days: days)
        
        item.name  = name
        item.room  = room
        item.light = light
        item.water = water
        item.days  = days
        
        if plantToEdit == nil {
                context.insert(item)
            }
        try? context.save()

        NotificationManager.shared.schedule(id: item.id.uuidString, days: item.days,plantName: item.name)
        }
    
    func title (in plants: [PlantsData]) -> String {
        let count = checkedCount(in: plants)
        return count > 0
        ? "\(count) of your plants feel loved today✨"
        : "Your plants are waiting for a sip 💦"
    }
    
    func progressCount (in plants: [PlantsData]) -> Float { // return number of progress percentage bar
        guard !plants.isEmpty else { return 0 }
        return Float(checkedCount(in: plants)) / Float(plants.count)
        
    }
    func checkedCount(in plants: [PlantsData]) -> Int { // return number of reminders that has been checked
        return plants.filter { $0.isChecked }.count
    }
    func toggle(_ plant: PlantsData) {
        plant.isChecked.toggle()
    }
    
    
    func deleteEditingPlant(context: ModelContext) {
        guard let plant = plantToEdit else { return }
        NotificationManager.shared.cancel(id: plant.id.uuidString)
        context.delete(plant)
        try? context.save()
    }
    func delete(_ plant: PlantsData, context: ModelContext) {
        NotificationManager.shared.cancel(id: plant.id.uuidString)
        try? context.save()
    }
    
    func sorted(_ plants: [PlantsData]) -> [PlantsData] {
        plants.filter { !$0.isChecked } + plants.filter { $0.isChecked }
    }
    
    
    
}
