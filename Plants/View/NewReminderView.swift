import SwiftUI
import SwiftData

struct NewReminder : View {
    @StateObject private var viewModel = NewReminderMV()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    Section {
                        HStack{
                            Text("Plant Name")
                            TextField("Pothos", text: $viewModel.name)
                        }
                    }//section 1
                    Section{
                        
                        Picker(selection: $viewModel.room) {
                            ForEach(viewModel.options2, id: \.self) { option in
                                   Text(option)
                               }
                           } label: {
                               Label("Room", systemImage: "location").foregroundStyle(.xx)
                           }
                            
                        Picker(selection: $viewModel.light) {
                            ForEach(viewModel.options3, id: \.name) { option in
                                    Label(option.name, systemImage: option.icon)
                                        .tag(option.name)
                                 
                                }
                            } label: {
                                Label("Light", systemImage: "sun.max").foregroundStyle(.xx)
                            }
                            
                        
                    }//section 2
                    Section{
                    
                        Picker(selection: $viewModel.days) {
                            ForEach(viewModel.options, id: \.self) { option in
                                   Text(option)
                               }
                           } label: {
                            Label("Watering Days", systemImage: "drop").foregroundStyle(.xx)
                        }
                        
                        
                        Picker(selection: $viewModel.water) {
                            ForEach(viewModel.options4, id: \.self) { option in
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
                            viewModel.saveReminder(context: context)
                            dismiss()
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
