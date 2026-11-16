import SwiftData
import SwiftUI
import Combine

struct todaysReminder: View {
    @ObservedObject var viewModel: PlantVM
    @Environment(\.modelContext) private var context
    @Query private var plants: [PlantsData]
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
           
                VStack {
                    Text("My Plants 🌱")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 34, weight: .bold))
                        .padding(24)
                    
                    Divider().background(Color.dcolor)
                    
    
                    VStack {
                        ProgressView(value: viewModel.progressCount(in: plants)) {
                            Text(viewModel.title(in: plants))
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.system(size: 18, weight: .regular))
                        }.padding(24)
                    }
                    .tint(Color("buttonscolor"))
                    .padding(.vertical, 8)
                    
                    List {
                        ForEach(viewModel.sorted(plants)) { plant in
                        HStack {
                            Button {
                                plant.isChecked.toggle()
                            } label: {
                                Image(systemName: plant.isChecked ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(.buttonscolor)
                            }
                            .padding(4)
                            
                            VStack {
                                Text("\(Image(systemName: "location")) \(plant.room)")
                                    .foregroundStyle(.reminders)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("\(plant.name)")
                                    .font(.system(size: 28, weight: .regular))
                                    .foregroundStyle(.xx)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .contentShape(Rectangle())
                                    .onTapGesture { viewModel.editing(plant)}
                                
                                HStack {
                                    Text("\(plant.light)")
                                        .foregroundStyle(.light)
                                        .font(.system(size: 14, weight: .medium))
                                        .frame(width: 102, height: 23)
                                        .background(Color.frame, in: RoundedRectangle(cornerRadius: 12))
                                    
                                    Text("\(plant.water)")
                                        .foregroundStyle(.water)
                                        .font(.system(size: 14, weight: .medium))
                                        .frame(width: 102, height: 23)
                                        .background(Color.frame, in: RoundedRectangle(cornerRadius: 12))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }.swipeActions {
                            Button(role: .destructive) {
                                viewModel.delete(plant, context: context)
                            }label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                    } .listStyle(.plain)                     .scrollContentBackground(.hidden)
                    
                }
            
            Button {
                viewModel.Adding()
            } label: {
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.circle)
            .tint(.buttonscolor)
            .padding(.trailing, 24)
            .padding(.bottom, 24)    }
    }
}
#Preview {
    todaysReminder(viewModel: PlantVM())
        .modelContainer(for: PlantsData.self, inMemory: true)

}


