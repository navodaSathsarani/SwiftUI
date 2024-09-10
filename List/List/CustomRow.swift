//
//  CustomRow.swift
//  List
//
//  Created by navoda on 2024-09-10.

import SwiftUI
struct Fruit: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

struct CustomRowListView: View {
    let fruits = [
        Fruit(name: "Apple", color: .red),
        Fruit(name: "Banana", color: .yellow),
        Fruit(name: "Grapes", color: .purple),
        Fruit(name: "Orange", color: .orange)
    ]

    var body: some View {
        List(fruits) { fruit in
            HStack {
                Circle()
                    .fill(fruit.color)
                    .frame(width: 30, height: 30)
                Text(fruit.name)
                    .font(.headline)
            }
        }
        .navigationTitle("Custom Row List")
    }
}

#Preview {
    CustomRowListView()
}
