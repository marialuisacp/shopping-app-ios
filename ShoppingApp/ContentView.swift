import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State var productsArray: [Product] = [Product]()
    
    var numbers = [0, 1, 2, 3]
    var body: some View {
        NavigationView {
            List(self.productsArray, id: \.self) { product in
                    NavigationLink {
                        VStack {
                                VStack(alignment: .leading) {
                                    Text(product.title)
                                        .font(.largeTitle)
                                    Divider().background(Color.black).padding(.trailing, 128)
                                    Text("Test")
                                        
                                    Divider().background(Color.black).padding(.trailing, 128)
                                }
                                .padding(.horizontal, 24)
                                .padding(.bottom, 64)
                        }
                    } label: {
                        
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: product.imageUrl)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            Text(product.title).font(.largeTitle)
                            Text(String(format: "%.2f", product.price))
                            Text(product.description)
                        }
                }
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
            _ = URLRequest(url: url)
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                        do {
                            print("Shopping Service:: serialize")
                            
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSObject] {
                                for product in json {
                                    let newProduct = Product(id: product.value(forKey: "id") as! Int,
                                                             categoty: product.value(forKey: "category") as! String,
                                                             imageUrl:  product.value(forKey: "image") as! String,
                                                             price: product.value(forKey: "price") as! Double,
                                                             title: product.value(forKey: "title") as! String,
                                                             description: product.value(forKey: "description") as! String)
                                    
                                    productsArray.append(newProduct)
                                }
                            }
                        } catch let error {
                            print("Shopping Service:: error on get produtcs")
                            print(error)
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
