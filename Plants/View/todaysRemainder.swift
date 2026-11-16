import SwiftData
import SwiftUI


struct todaysReminder: View {
    @ObservedObject var viewModel: PlantVM
    @Query private var plants: [PlantsData]
    
    var body: some View {
        ScrollView {
            VStack{
                Text("My Plants 🌱")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 34, weight: .bold))
                    .padding(24)
                
                Divider().background(Color.dcolor)
                
                VStack{
                    ProgressView(value: viewModel.progressCount(in: plants)){
                        Text(viewModel.title(in: plants))
                            .padding(.vertical ,8)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .font(.system(size: 18, weight: .regular))
                    }.padding(24)
                }.tint(Color("buttonscolor"))
                    .padding(.vertical , 8)
                
                Spacer()
                
                LazyVStack(spacing: 0){
                    ForEach(plants) { plant in
                        HStack{
                            Button{//check
                                plant.isChecked.toggle()
                            }label: {
                                Image(systemName: plant.isChecked ? "checkmark.circle.fill" : "circle").foregroundStyle(.buttonscolor)
                                
                            }
                            .padding(4)
                            
                            VStack{
                                
                                Text("\(Image(systemName: "location")) \(plant.room)").foregroundStyle(.reminders).font(.system(size: 15, weight: .regular)).frame(maxWidth: .infinity, alignment: .leading)//location
                                
                                
                                Text("\(plant.name)").font(.system(size: 28,weight:.regular)).foregroundStyle(.xx).frame(maxWidth: .infinity, alignment: .leading)//name
                                
                                
                                HStack{
                                    Text("\(plant.light)").foregroundStyle(.light).font(.system(size: 14 , weight:.medium)).frame(width: 102, height: 23)
                                        .background(Color.frame , in: RoundedRectangle(cornerRadius: 12))
                                    
                                    Text("\(plant.water)").foregroundStyle(.water).font(.system(size: 14 ,
                                                                                                weight:.medium)).frame(width: 102, height: 23)
                                        .background(Color.frame , in: RoundedRectangle(cornerRadius: 12))
                                    //الايت و الواتر
                                }.frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }.padding()
                    
                    
                }
            }
        }
        Button{
            viewModel.showForm = true
            
        }label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 44, height: 44)
            
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.circle)
        .tint(.buttonscolor)
        .sheet(isPresented: $viewModel.showForm) {
            NewReminder()
        }.frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, 24 )
        
        
    }
}


