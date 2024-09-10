//
//  ListwithNavigation.swift
//  List
//
//  Created by navoda on 2024-09-10.
//

import SwiftUI

struct FruitDetailView: View {
    let fruit: String
    
    var body: some View {
        Text("This is the detail view for \(fruit)")
            .font(.largeTitle)
            .padding()
    }
}

struct ListWithNavigationView: View {
    let fruits = ["Apple", "Banana", "Grapes", "Orange"]

    var body: some View {
        List(fruits, id: \.self) { fruit in
            NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                Text(fruit)
            }
        }
        .navigationTitle("List with Navigation Links")
    }
}

#Preview {
    ListWithNavigationView()
}

