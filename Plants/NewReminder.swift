import SwiftUI
import SwiftData

struct NewReminder : View {
    @Environment(\.dismiss) private var dismiss
    //@Environment(\.) private var save
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    
                }
                
                    
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Set Reminder").font(.system(size: 17).weight(.semibold))
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
