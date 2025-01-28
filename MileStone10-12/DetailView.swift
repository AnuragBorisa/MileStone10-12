//
//  DetailView.swift
//  MileStone10-12
//
//  Created by Anurag on 28/01/25.
//

import SwiftUI

struct DetailView: View {
    var user : User
    var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Section {
                    Text("Name: \(user.name)").font(.title)
                    Text("Age: \(user.age)").font(.subheadline)
                    Text("Registered: \(user.registered, formatter: dateFormatter)")
                }
                
                Section {
                    Text("Friends:").font(.headline)
                    ForEach(user.friends, id: \.id) { friend in
                        Text("\(friend.name)")
                    }
                }
            }
            .padding()
            .navigationTitle(user.name)
        }
        
        private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter
        }
    }

#Preview {
    DetailView(user: MockData.sampleUser)
}
