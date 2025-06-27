//
//  ContentView.swift
//  ObservationDemo
//
//  Created by navoda on 2025-06-20.
//

import SwiftUI
import Observation

// MARK: - ViewModel using @Observable
@Observable
class ProfileViewModel {
    var name: String = "Taylor"
    var score: Int = 42

    func increaseScore() { score += 1 }
}

enum Screen: Hashable {
    case profile
    case settings
}

struct ContentView: View {
    @State private var path: [Screen] = []
    @Namespace private var animation
    @State private var expanded = false

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 40) {
                // Animated Card
                ZStack {
                    if !expanded {
                        CardView()
                            .matchedGeometryEffect(id: "card", in: animation)
                            .onTapGesture { withAnimation(.spring()) { expanded = true } }
                    } else {
                        DetailedView()
                            .matchedGeometryEffect(id: "card", in: animation)
                            .onTapGesture { withAnimation(.spring()) { expanded = false } }
                    }
                }
                .frame(height: expanded ? 220 : 120)
                .padding(.top, 50)

                // Navigation Buttons
                HStack {
                    Button("Go to Profile") { path.append(.profile) }
                        .buttonStyle(.borderedProminent)
                    Button("Settings") { path.append(.settings) }
                        .buttonStyle(.bordered)
                }
            }
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .profile: ProfileScreen()
                case .settings: SettingsScreen()
                }
            }
        }
    }
}

// MARK: - Card Views for Animation Example
struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(Color.blue.gradient)
            .overlay(
                Text("Tap to Expand")
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
            )
            .shadow(radius: 10)
            .padding()
    }
}

struct DetailedView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(Color.purple.gradient)
            .overlay(
                VStack {
                    Text("Expanded Card")
                        .font(.title)
                        .bold()
                    Text("Tap to Collapse")
                        .foregroundColor(.white.opacity(0.8))
                }
            )
            .shadow(radius: 20)
            .padding(.horizontal)
    }
}

// MARK: - Profile and Settings Screens
struct ProfileScreen: View {
    @State private var vm = ProfileViewModel()
    var body: some View {
        VStack(spacing: 16) {
            Text("Profile")
                .font(.largeTitle)
                .bold()
            Text("Name: \(vm.name)")
            Text("Score: \(vm.score)")
            Button("Increase Score") { vm.increaseScore() }
        }
        .padding()
    }
}

struct SettingsScreen: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Settings")
                .font(.largeTitle)
                .bold()
            Text("App version 1.0")
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}


