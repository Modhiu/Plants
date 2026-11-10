import SwiftData

@Model
class PlantsData{
    var name : String
    var room : String
    var light : String
    var water : String
    var days : String
    

init(name: String, room: String, light: String, water: String, days: String) {
      self.name = name
      self.room = room
      self.light = light
      self.water = water
      self.days = days
  }
}

