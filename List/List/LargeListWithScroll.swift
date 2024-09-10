//
//  LargeListWithScroll.swift
//  List
//
//  Created by navoda on 2024-09-10.
//

import SwiftUI

struct LazyVStackListView: View {
    let items = Array(1...1000).map { "Item \($0)" }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("LazyVStack List")
    }
}

#Preview {
    LazyVStackListView()
}
