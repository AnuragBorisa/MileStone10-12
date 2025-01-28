//
//  ContentView.swift
//  MileStone10-12
//
//  Created by Anurag on 28/01/25.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var  users : [User]
    
    func loadData() async {
        guard let url  = URL(string:"https://www.hackingwithswift.com/samples/friendface.json") else {
            print("invalid string")
            return
        }
        
        do {
            
            let (data,_) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
                       decoder.dateDecodingStrategy = .iso8601
            
            if let decodedResponse = try? decoder.decode([User].self,from:data){
                
                for user in decodedResponse {
                    modelContext.insert(user)
                }
            }
            
        } catch {
            print("Invalid data")
        }
    }
    
    var body: some View {
          NavigationStack {
              List {
                  ForEach(users) { user in
                      NavigationLink(value : user) {
                          VStack(alignment: .leading) {
                              Text("Name: \(user.name)")
                                  .font(.headline)
                              Text("Status: \(user.isActive ? "Active" : "Inactive")")
                                  .font(.subheadline)
                                  .foregroundColor(user.isActive ? .green : .red)
                          }
                      }
                  }
              }.navigationDestination(for: User.self){user in
                  DetailView(user:user);
              }
              .navigationTitle("FriendFace")
              .task {
                  
                  if(users.isEmpty){
                      await loadData()
                  }
                
              }
          }
      }
  }
#Preview {
    ContentView()
}
