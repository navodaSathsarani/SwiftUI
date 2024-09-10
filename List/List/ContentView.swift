//
//  ContentView.swift
//  List
//
//  Created by navoda on 2024-09-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                // List of List examples to navigate between
                NavigationLink("Basic List with Custom Row", destination: CustomRowListView())
                NavigationLink("List with Sections", destination: SectionedListView())
                NavigationLink("Swipe Actions in List", destination: SwipeActionListView())
                NavigationLink("Dynamic List with Identifiable Model", destination: DynamicListView())
                NavigationLink("Editable List (Delete & Move)", destination: EditableListView())
                NavigationLink("List with Navigation Links", destination: ListWithNavigationView())
                NavigationLink("LazyVStack in ScrollView for Large Lists", destination: LazyVStackListView())
                NavigationLink("List with Custom Data Model", destination: ProductListView())
            }
            .navigationTitle("List Showcase")
        }
    }
}

#Preview {
    ContentView()
}

