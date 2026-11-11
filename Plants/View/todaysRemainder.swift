import SwiftData
import SwiftUI


struct todaysReminder: View {
    @StateObject private var viewModel = todaysReminderMV()
    var body: some View {
        VStack{
            Text("My Plants 🌱")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 34, weight: .bold))
                .padding(10)
            
            Divider().background(Color.dcolor).padding(10)
            
            VStack{
                ProgressView(value: 0.5){
                    if viewModel.reminders > 0 {
                        Text("\(viewModel.reminders) of your plants feel loved today✨").frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 18, weight: .regular))}
                    else {
                        Text("Your plants are waiting for a sip 💦").frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 18, weight: .regular))
                    }
                }
                .padding(10)
            }
            .padding(.horizontal, 26)
            
            
        }
        
    }
    
}

#Preview {
    todaysReminder()
}
