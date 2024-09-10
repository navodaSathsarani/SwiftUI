//
//  EditableList.swift
//  List
//
//  Created by navoda on 2024-09-10.
//

import SwiftUI

struct EditableListView: View {
    @State private var fruits = ["Apple", "Banana", "Grapes", "Orange", "Peach"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit)
            }
            .onDelete(perform: deleteItems)
            .onMove(perform: moveItems)
        }
        .toolbar {
            EditButton() // Adds an Edit button for moving/deleting items
        }
        .navigationTitle("Editable List")
    }
    
    func deleteItems(at offsets: IndexSet) {
        fruits.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        fruits.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    EditableListView()
}

