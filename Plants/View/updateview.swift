
import SwiftUI
import SwiftData

struct updateview: View {

    let plant: PlantsData

    @StateObject private var viewModel = PlantMV()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Text("Plant Name")
                        TextField("Pothos", text: $viewModel.name)
                    }
                } // section 1

                Section {
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
                } // section 2

                Section {
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
                } // section 3

                Section {
                    Button {
                        viewModel.deleteSelectedPlant(plant: plant, context: context)
                        dismiss()
                    } label: {
                        Text("Delete Reminder")
                            .font(.system(size: 18))
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Set Reminder")
                        .font(.system(size: 17).weight(.semibold))
                        .foregroundStyle(.xx)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.updatereminder(plant: plant, context: context)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.buttonscolor)
                }
            }
        }
        .onAppear {
            viewModel.load(plant: plant)
        }
    }

    
}

#Preview {
    let container = try! ModelContainer(
        for: PlantsData.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    let sample = PlantsData(name: "Pothos", room: "Bedroom", light: "Full sun",
                            water: "20-50 ml", days: "Mon", isChecked: false)
    container.mainContext.insert(sample)

    return updateview(plant: sample)
        .modelContainer(container)
}
