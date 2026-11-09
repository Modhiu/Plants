import SwiftUI
import Playgrounds
import SwiftData

struct homePage: View {
    @State private var showCover = false
    
    var body: some View {
        VStack{
            Text("My Plants 🌱")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 34, weight: .bold))
                .padding(10)
            
            Divider().background(Color.dcolor).padding(10)
           
            Spacer().frame(height: 73)
            Image(.plant)
            
                .padding()
            Text("Start your plant journey! ").frame(maxWidth: .infinity, alignment: .center).font(.system(size: 25, weight: .semibold))
            
                .padding()
            
            Text("Now all your plants will be in one place and we will help you take care of them :)🪴").frame(maxWidth: .infinity, alignment: .center).font(.system(size: 16, weight: .regular))  .foregroundStyle(.textcolor).multilineTextAlignment(.center)
                .padding(20)
            
            NavigationStack{
                Button{
                    showCover = true
                }label: {
                    Text("Set Plant Reminder")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(width: 281, height: 43)
                        .background(Color.buttonscolor)
                        .cornerRadius(90)
                }
            }
            
            
        }.background(Color.background.ignoresSafeArea())
        
            .fullScreenCover(isPresented: $showCover) {
                NewReminder()
            }
    }
}


#Preview {
    homePage()
}

#Playground {
    _ = 1 + 2
}
