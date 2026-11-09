import SwiftData

@Model
class PlantsData{
    var id : Int
    var name : String
    var room : String
    var light : String
    var water : String
    var days : String
    

init(id: Int, name: String, room: String, light: String, water: String, days: String) {
      self.id = id
      self.name = name
      self.room = room
      self.light = light
      self.water = water
      self.days = days
  }
}
//init(id: Int, name: String , room: String , light : String = "Full sun" , water : String = "20 - 50 ml" , days : String = "Every day") {
   
   
