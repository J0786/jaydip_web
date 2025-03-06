//
//  SplashScreen.swift
//  HelloWorld
//
//  Created by jaydip on 19/12/24.
//

import SwiftUI

// SplashScreen View
struct SplashScreenView: View {
    @State private var isVisible = false
    
    var body: some View {
        ZStack {
            // Background color
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            // Logo and Text animation
            VStack {
                Image(systemName: "star.fill") // Replace with your logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .opacity(isVisible ? 1 : 0) // Animation for logo
                
                Text("Awesome App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(isVisible ? 1 : 0) // Animation for text
                    .padding(.top, 20)
            }
            .onAppear {
                withAnimation(.easeIn(duration: 2.0)) {
                    isVisible = true // Start animation when splash screen appears
                }
                
                // Transition to the main view after a delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        isVisible = false
                    }
                    // You can replace the next line with navigation to your main view
                    // Here we use a simple navigation to a ContentView
                    navigateToMainView()
                }
            }
        }
    }
    
    func navigateToMainView() {
        // Your navigation logic goes here, for example:
        // Navigate to the main content view (replace with your main view logic)
        let contentView = ContentView()
        // Example of presenting the main view in the current view context:
        UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: contentView)
    }
}

// Main Content View (replace with your main view content)
/*struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Awesome App!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
            }
        }
    }
}*/

#Preview {
    SplashScreenView()
}
