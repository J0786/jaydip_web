//
//  StateManagement.swift
//  HelloWorld
//
//  Created by jaydip on 18/12/24.
//

import SwiftUI
import Foundation

struct StateManagement: View {
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                    //.padding()
                
                RoundedRectangle(cornerSize: CGSizeMake(10, 10))
                    .fill(Color.green)
                    .frame(width: 100, height: 100)
                    //.padding()
                
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 50, topTrailing: 50))
                                .fill(.orange)
                                .frame(width: 100, height: 100)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    //.padding()

                Ellipse()
                    .fill(Color.yellow)
                    .frame(width: 80, height: 100)
                    //.padding()
                
                Capsule()
                    .fill(Color.purple)
                    .frame(width: 100, height: 50)
                    //.padding()
                
                /// Custom Square
                /*Path { path in
                    path.move(to: CGPoint(x: 50, y: 50))
                    path.addLine(to: CGPoint(x: 150, y: 50))
                    path.addLine(to: CGPoint(x: 150, y: 150))
                    path.addLine(to: CGPoint(x: 50, y: 150))
                    path.closeSubpath()
                }
                .fill(Color.blue)*/
                
                /// custom Triangle
                /*Path { path in
                    path.move(to: CGPoint(x: 100, y: 20))
                    path.addLine(to: CGPoint(x: 50, y: 150))
                    path.addLine(to: CGPoint(x: 150, y: 150))
                    path.closeSubpath()
                }
                .fill(Color.yellow)*/
                
                /// custom arc
                /*Path { path in
                    path.addArc(center: CGPoint(x: 100, y: 100), radius: 50, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: false)
                }
                .stroke(Color.blue, lineWidth: 5)*/
                
                StarShape()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
                
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 10))
                    path.addLine(to: CGPoint(x: 200, y: 200))
                }
                .stroke(Color.red, lineWidth: 2)
                
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .background(Color.gray)
            //.padding(.vertical)
            //.safeAreaPadding()
        }
    }
}


struct StarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius: CGFloat = rect.width / 2
        let angle = 2 * Double.pi / 5
        
        for i in 0..<5 {
            let x = center.x + radius * cos(angle * CGFloat(i))
            let y = center.y + radius * sin(angle * CGFloat(i))
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        path.closeSubpath()
        return path
    }
}

// gradient signup screen
/*struct SignUpView: View {
    // Form Fields
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    // Validation State
    @State private var showPasswordError = false
    @State private var isEmailValid = true
    
    // Handle Sign Up Action
    func signUpAction() {
        // Simple validation check
        showPasswordError = password != confirmPassword
        isEmailValid = email.contains("@") && email.contains(".")
        
        if !showPasswordError && isEmailValid {
            // Proceed with Sign-Up action (e.g., call API)
            print("Sign Up Successful!")
        }
    }

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Title
                Text("Create Account")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 80)
                
                Spacer()
                
                // Form Stack
                VStack(spacing: 18) {
                    CustomTextField(icon: "person", placeholder: "Username", text: $username)
                    CustomTextField(icon: "envelope", placeholder: "Email", text: $email)
                        .keyboardType(.emailAddress)
                    CustomSecureField(placeholder: "Password", text: $password)
                    CustomSecureField(placeholder: "Confirm Password", text: $confirmPassword)
                    
                    // Error Handling
                    if showPasswordError {
                        Text("Passwords do not match")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.top, -10)
                    }
                    
                    if !isEmailValid && !email.isEmpty {
                        Text("Please enter a valid email address.")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.top, -10)
                    }
                    
                    // Sign Up Button
                    Button(action: signUpAction) {
                        Text("Sign Up")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                                                       startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(12)
                            .shadow(radius: 10)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 25)
                    
                    // Terms & Conditions Text
                    HStack {
                        Text("By signing up, you agree to our")
                            .foregroundColor(.white)
                            .font(.footnote)
                        Text("Terms & Conditions")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .onTapGesture {
                                print("Navigate to Terms & Conditions")
                            }
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                }
                .padding(.horizontal, 25) // Horizontal Padding for form fields
                .frame(maxWidth: .infinity, alignment: .center) // Ensures centered alignment
            }
            .padding(.bottom, 20)
        }
    }
}

struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
            TextField(placeholder, text: $text)
                .padding(16)
                .background(RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color.clear, lineWidth: 1)
                )
                .foregroundColor(.white)
                .keyboardType(.default)
        }
        .padding(.horizontal)
        .frame(height: 55) // Uniform height
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.2)))
    }
}

struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "lock")
                .foregroundColor(.white)
            SecureField(placeholder, text: $text)
                .padding(16)
                /*.background(RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color.white, lineWidth: 1)
                )*/
                .background(RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color.clear, lineWidth: 1)
                )
                .foregroundColor(.white)
        }
        .padding(.horizontal)
        .frame(height: 55) // Uniform height
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.2)))
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 14")
        
        SignUpView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone SE (3rd generation)")
    }
}*/

struct SignUpView: View {
    // Form Fields
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    // Validation State
    @State private var showPasswordError = false
    @State private var isEmailValid = true
    @State private var animateError = false
    
    // Handle Sign Up Action
    func signUpAction() {
        // Simple validation check
        showPasswordError = password != confirmPassword
        isEmailValid = email.contains("@") && email.contains(".")
        
        // Trigger error animation if necessary
        animateError = showPasswordError || !isEmailValid
        
        if !showPasswordError && isEmailValid {
            // Proceed with Sign-Up action (e.g., call API)
            print("Sign Up Successful!")
        }
    }

    var body: some View {
        ZStack {
            // Background Gradient (Subtle transition of colors)
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Title
                Text("Create Account")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top, 80)
                
                Spacer()
                
                // Form Stack with Animations
                VStack(spacing: 20) {
                    CustomTextField(icon: "person", placeholder: "Username", text: $username)
                    CustomTextField(icon: "envelope", placeholder: "Email", text: $email)
                        .keyboardType(.emailAddress)
                    CustomSecureField(placeholder: "Password", text: $password)
                    CustomSecureField(placeholder: "Confirm Password", text: $confirmPassword)
                    
                    // Error Handling
                    if showPasswordError {
                        Text("Passwords do not match")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.top, -10)
                            .transition(.move(edge: .top)) // Smooth transition for error
                    }
                    
                    if !isEmailValid && !email.isEmpty {
                        Text("Please enter a valid email address.")
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.top, -10)
                            .transition(.move(edge: .top)) // Smooth transition for error
                    }
                    
                    // Sign Up Button with Animations
                    Button(action: signUpAction) {
                        Text("Sign Up")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                                                       startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(12)
                            .shadow(radius: 10)
                            .scaleEffect(animateError ? 1.1 : 1) // Button scale animation on error
                            .animation(.easeInOut(duration: 0.2), value: animateError)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 25)
                    
                    // Terms & Conditions Text
                    HStack {
                        Text("By signing up, you agree to our")
                            .foregroundColor(.white)
                            .font(.footnote)
                        Text("Terms & Conditions")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .onTapGesture {
                                print("Navigate to Terms & Conditions")
                            }
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                }
                .padding(.horizontal, 25) // Horizontal Padding for form fields
                .frame(maxWidth: .infinity, alignment: .center) // Ensures centered alignment
            }
            .padding(.bottom, 20)
        }
    }
}

struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
            TextField(placeholder, text: $text)
                .padding(16)
                .background(RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color.white, lineWidth:0))
                .foregroundColor(.white)
                .keyboardType(.default)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .padding(.horizontal)
        .frame(height: 55) // Uniform height
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.2)))
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5) // Soft shadow for better focus
        .animation(.easeInOut(duration: 0.3)) // Animation for focus state
    }
}

struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "lock")
                .foregroundColor(.white)
            SecureField(placeholder, text: $text)
                .padding(16)
                .background(RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color.white, lineWidth: 0))
                .foregroundColor(.white)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .padding(.horizontal)
        .frame(height: 55) // Uniform height
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.2)))
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5) // Soft shadow for better focus
        .animation(.easeInOut(duration: 0.3)) // Animation for focus state
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 14")
        
        SignUpView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone SE (3rd generation)")
    }
}

//#Preview {
//    SignUpView()
    //StateManagement()
//}
