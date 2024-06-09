import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State var productsArray: [NSObject] = [NSObject]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        VStack {
                                VStack(alignment: .leading) {
                                    Text("Product Name")
                                        .font(.largeTitle)
                                    Divider().background(Color.black).padding(.trailing, 128)
                                    Text("Finally, it's here: Travelling to space. With just a few simple clicks, you can book your ticket on the next shuttle to the Moon!\n\nFor real adventurous travellers, we also offer trips to Mars. In our new shuttle X1, you will be there in no time with the newest and most comfortable travelling options.")
                                        
                                    Divider().background(Color.black).padding(.trailing, 128)
                                }
                                .padding(.horizontal, 24)
                                .padding(.bottom, 64)
                        }
                    } label: {
                        
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            Text("Product").font(.largeTitle)
                            Text("Your perfect pack for everyday use and walks in the forest.")
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            
            Text("Select an item")
        }
        .task {
            
            guard let url = URL(string: "https://fakestoreapi.com/products") else {
                return
            }
            let request = URLRequest(url: url)
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                        do {
                            print("Shopping Service:: serialize")
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSObject] {
                                self.productsArray = json
                                print("Shopping Service:: save products")
                                print(self.productsArray)
                            }
                        } catch let error {
                            print("Shopping Service:: error on get produtcs")
                            print(error.localizedDescription)
                        }
                
            } catch {
                print("Failed to fetch site.")
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
