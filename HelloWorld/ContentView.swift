//
//  ContentView.swift
//  HelloWorld
//
//  Created by jaydip on 18/12/24.
//

import SwiftUI

struct ContentView: View {
    // State variable to control visibility of the first Text
    @State private var isTextHidden = false
    
    var body: some View {
        /*ZStack {
            Color.red
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 5)
                .opacity(0.5)
                .background(Color.blue)
                .cornerRadius(4)
                .padding(.all, 10)
                .shadow(color: .gray, radius: 5, x: 1, y: -1)
            
            VStack {
                HStack {
                    // Conditionally show or hide the first Text based on isTextHidden
                    if !isTextHidden {
                        Text("Hello, World")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.red)
                            .background(Color.blue)
                            .cornerRadius(4)
                            .padding(.all, 10)
                            .shadow(color: .gray, radius: 5, x: 1, y: -1)
                            .strikethrough(true, pattern: .solid, color: .black)
                            .underline(true, pattern: .solid, color: .black)
                            .textCase(.lowercase)
                    }
                    Divider()
                    Text("Hello, World")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.red)
                        .background(Color.blue)
                        .cornerRadius(4)
                        .padding(.all, 10)
                        .shadow(color: .gray, radius: 5, x: 1, y: -1)
                        .strikethrough(true, pattern: .solid, color: .black)
                        .underline(true, pattern: .solid, color: .black)
                        .textCase(.lowercase)
                }
                Rectangle()
                    .fill(.blue)
                    .border(.red, width: 5)
                    .padding(25)
                Circle()
                    .stroke(.red, lineWidth: 5)
                    .fill(.yellow)
                    .padding(0)
                Section {
                    Text("Hello, World")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.red)
                        .background(Color.blue)
                        .cornerRadius(4)
                        .padding(.all, 10)
                }
                VStack {
                    Text("Hello, World")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.red)
                        .background(Color.blue)
                        .cornerRadius(4)
                        .padding(.all, 10)
                        .shadow(color: .gray, radius: 5, x: 1, y: -1)
                        .strikethrough(true, pattern: .solid, color: .black)
                        .underline(true, pattern: .solid, color: .black)
                        .textCase(.lowercase)
                    Text("Hello, World")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.red)
                        .background(Color.blue)
                        .cornerRadius(4)
                        .padding(.all, 10)
                        .shadow(color: .gray, radius: 5, x: 1, y: -1)
                        .strikethrough(true, pattern: .solid, color: .black)
                        .underline(true, pattern: .solid, color: .black)
                        .textCase(.lowercase)
                    Button("Button") {
                        print("Hello world!!")
                        sum()
                        // Toggle the visibility of the first Text
                        isTextHidden.toggle()
                    }
                    .foregroundColor(.green)
                    .font(.title)
                    .background(Color.red, alignment: .center)
                    .cornerRadius(5)
                    .padding(.all, 5)
                    Divider()
                }
            }
        }*/
        
        NavigationView {
            VStack {
                Text("Welcome to the Awesome App!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
            }
        }
    }
    
    // Your sum function (not defined in the code provided, so just an empty placeholder)
    func sum() {
        let a = 1
        let b = 2
        let sum = a + b
        print(sum)
    }
}

#Preview {
    ContentView()
}
