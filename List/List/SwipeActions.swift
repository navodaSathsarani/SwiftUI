//
//  SwipeActions.swift
//  List
//
//  Created by navoda on 2024-09-10.
//

import SwiftUI

struct SwipeActionListView: View {
    @State private var fruits = ["Apple", "Banana", "Grapes", "Orange"]

    var body: some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            delete(fruit: fruit)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }

                        Button {
                            edit(fruit: fruit)
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                    }
            }
        }
        .navigationTitle("Swipe Action List")
    }

    func delete(fruit: String) {
        fruits.removeAll { $0 == fruit }
    }

    func edit(fruit: String) {
        print("Editing \(fruit)")
    }
}

#Preview {
    SwipeActionListView()
}
