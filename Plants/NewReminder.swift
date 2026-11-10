import SwiftUI
import SwiftData

struct NewReminder : View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var name = ""
    @State private var room = "Bedroom"
    @State private var light = "Full sun"
    @State private var water = "20-50 ml"
    @State private var days = "Every day"
    let options = ["Every day", "Every 2 days", "Every 3 days", "one a week" , "Evrey 10 days" , "Every 2 weeks"]
    let options2 = ["Bedroom", "Living Room", "Kitchen", "Balcony" , "Bathroom"]
    let options4 = ["20-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    let options3 = [
        (name: "Full sun", icon: "sun.max.fill"),
        (name: "Partial sun", icon: "cloud.sun.fill"),
        (name: "Low light", icon: "cloud.fill")
    ]

    func saveReminder(){
        let plant = PlantsData(
                               name: name,
                               room: room,
                               light: light,
                               water: water,
                               days: days)
        context.insert(plant)
        dismiss()
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    Section {
                        HStack{
                            Text("Plant Name")
                            TextField("Pothos", text: $name)
                        }
                    }//section 1
                    Section{
                        
                            Picker(selection: $room) {
                               ForEach(options2, id: \.self) { option in
                                   Text(option)
                               }
                           } label: {
                               Label("Room", systemImage: "location").foregroundStyle(.xx)
                           }
                            
                            Picker(selection: $light) {
                                ForEach(options3, id: \.name) { option in
                                    Label(option.name, systemImage: option.icon)
                                        .tag(option.name)
                                 
                                }
                            } label: {
                                Label("Light", systemImage: "sun.max").foregroundStyle(.xx)
                            }
                            
                        
                    }//section 2
                    Section{
                    
                            Picker(selection: $days) {
                               ForEach(options, id: \.self) { option in
                                   Text(option)
                               }
                           } label: {
                            Label("Watering Days", systemImage: "drop").foregroundStyle(.xx)
                        }
                        
                        
                        Picker(selection: $water) {
                           ForEach(options4, id: \.self) { option in
                               Text(option)
                           }
                       } label: {
                           Label("Water", systemImage: "drop").foregroundStyle(.xx)
                       }
                    }//section 3
                }
                    
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Set Reminder").font(.system(size: 17).weight(.semibold))
                        .foregroundStyle(.xx)
                   }
                        ToolbarItem(placement: .topBarLeading) {
                            Button{
                                dismiss()
                            }label: {
                                Image(systemName: "xmark")
                            }
                            
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button{
                               // save()
                            }label: {
                                Image(systemName: "checkmark")
                                
                            } .buttonStyle(.borderedProminent)
                                .tint(.buttonscolor)
                        }
                    }
            }
        }
    }
}
#Preview {
    homePage()
}
