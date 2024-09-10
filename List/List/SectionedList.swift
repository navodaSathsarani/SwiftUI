//
//  SectionedList.swift
//  List
//
//  Created by navoda on 2024-09-10.
//

import SwiftUI

struct SectionedListView: View {
    let tropicalFruits = ["Mango", "Pineapple", "Papaya"]
    let temperateFruits = ["Apple", "Peach", "Plum"]

    var body: some View {
        List {
            Section(header: Text("Tropical Fruits")) {
                ForEach(tropicalFruits, id: \.self) { fruit in
                    Text(fruit)
                }
            }

            Section(header: Text("Temperate Fruits")) {
                ForEach(temperateFruits, id: \.self) { fruit in
                    Text(fruit)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Sectioned List")
    }
}

#Preview {
    SectionedListView()
}

