import Foundation
import Combine
import SwiftData


class NewReminderMV : ObservableObject{
    @Published  var name = ""
    @Published  var room = "Bedroom"
    @Published  var light = "Full sun"
    @Published  var water = "20-50 ml"
    @Published  var days = "Every day"
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
            days: days
        )
        context.insert(plant)
    }
}
