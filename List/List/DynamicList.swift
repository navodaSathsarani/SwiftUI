//
//  DynamicList.swift
//  List
//
//  Created by navoda on 2024-09-10.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
}

struct DynamicListView: View {
    let people = [
        Person(name: "John", age: 25),
        Person(name: "Alice", age: 30),
        Person(name: "David", age: 22)
    ]
    
    var body: some View {
        List(people) { person in
            VStack(alignment: .leading) {
                Text(person.name)
                    .font(.headline)
                Text("Age: \(person.age)")
                    .font(.subheadline)
            }
        }
        .navigationTitle("Dynamic List")
    }
}

#Preview {
    DynamicListView()
}
