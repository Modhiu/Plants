import SwiftData
import SwiftUI


struct todaysReminder: View {
    @StateObject private var viewModel = todaysReminderMV()
    @StateObject private var newreminder = plantMV()
    @Query private var plants: [PlantsData]
    
    var body: some View {
        VStack{
            Text("My Plants 🌱")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 34, weight: .bold))
                .padding(10)
            
            Divider().background(Color.dcolor).padding(10)
            
            VStack{
                ProgressView(value: viewModel.ProgressCount(in: plants)){
                    Text(viewModel.title(in: plants))
                        .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 18, weight: .regular))
                    }
                }.tint(Color("buttonscolor"))
                    .padding(.vertical , 39)
                
            Spacer()
            
            List(plants) { plant in
                HStack{
                    Button{//check
                        
                    }label: {
                        
                    }
                    
                    VStack{
                        //لوكيشن
                        //نيم
                        HStack{
                            //الايت و الواتر
                        }
                        
                    }//الصف
                }
                
            }.padding()
            
                
                
                
                
                Button{
                    newreminder.showCover = true
                    
                }label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                    
                }.sheet(isPresented: $newreminder.showCover) {NewReminder()}
        
                        .buttonStyle(.borderedProminent)
                        .clipShape(.circle)
                        .tint(.buttonscolor)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(-2)
                }
        .padding(.horizontal, 24 )
                
                
        }
            
        }
        
    


#Preview {
    todaysReminder()
}
