//
//  ListWithActions.swift
//  List
//
//  Created by navoda on 2024-09-10.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
}

struct ProductListView: View {
    let products = [
        Product(name: "iPhone", price: 999),
        Product(name: "iPad", price: 799),
        Product(name: "MacBook", price: 1299)
    ]

    var body: some View {
        List(products) { product in
            HStack {
                Text(product.name)
                    .font(.headline)
                Spacer()
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
            }
            .onTapGesture {
                print("Selected product: \(product.name)")
            }
        }
        .navigationTitle("Product List")
    }
}

#Preview {
    ProductListView()
}

