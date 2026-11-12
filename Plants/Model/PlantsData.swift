import SwiftData

@Model
class PlantsData{
    var name : String
    var room : String
    var light : String
    var water : String
    var days : String
    var isChecked: Bool

    init(name: String, room: String, light: String, water: String, days: String ,isChecked : Bool) {
      self.name = name
      self.room = room
      self.light = light
      self.water = water
      self.days = days
      self.isChecked = isChecked
  }
}

