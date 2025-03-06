//
//  GoodZSplash.swift
//  HelloWorld
//
//  Created by jaydip on 19/12/24.
//

import SwiftUI

struct GoodZSplash: View {
    var body: some View {
        /*LinearGradient(gradient: Gradient(colors: [Color(hex: "#8FCBB4"), Color(hex: "#9BD1C6")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea() // This makes the gradient fill the entire screen
        
        
        /*RadialGradient(gradient: Gradient(colors: [Color(hex: "#8FCBB4"), Color(hex: "#9BD1C6")]),
                       center: .center,
                       startRadius: 5,
                       endRadius: 300)
            .ignoresSafeArea()*/
        
        /*AngularGradient(gradient: Gradient(colors: [Color(hex: "#8FCBB4"), Color(hex: "#9BD1C6")]),
                        center: .center)
            .ignoresSafeArea()*/
        
        .overlay {
            
            /*HalfCircle(isTopHalf: true)
                .fill(Color(hex: "#CAE9E2"))
                .opacity(0.4)
                .frame(width: 101, height: 247)
                .position(CGPoint(x: 0, y: 90))
            
            Image(.logo)
                .scaledToFill()
            
            HalfCircle(isTopHalf: false)
                .fill(Color(hex: "#CAE9E2"))
                .opacity(0.4)
                .frame(width: 101, height: 247)
                .position(CGPoint(x: UIScreen.main.bounds.width - 0, y: UIScreen.main.bounds.height - 210))*/
            DynamicOverlayView()
        }*/
        
        VStack(alignment: .leading, spacing: 0) {
            List(0..<10){ _ in
                HStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .padding(1)
                    Spacer()
                }
                Spacer()
            }
        }
        //.edgesIgnoringSafeArea(.all)  // Ignore safe areas if needed
        .background(Color.white)
    }
}

struct GoodZSplash_Previews: PreviewProvider {
    static var previews: some View {
        
        GoodZSplash()
        
        /*GoodZSplash()
            .previewDevice("iPhone 14 Pro Max") // Use a larger device
            .previewDisplayName("iPhone 14 Pro Max")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        
        GoodZSplash()
            .previewDisplayName("iPhone SE")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone SE (3rd generation)")
        
        GoodZSplash()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewDisplayName("iPad Pro 12.9")
            .preferredColorScheme(.light)*/
    }
}

struct HalfCircle: Shape {
    var isTopHalf: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height)
        //let radius = min(rect.width, rect.height) / 2
        
        if isTopHalf {
            // Draw top half-circle
            path.addArc(center: center, radius: radius, startAngle: .degrees(270), endAngle: .degrees(90), clockwise: false)
        } else {
            // Draw bottom half-circle
            path.addArc(center: center, radius: radius, startAngle: .degrees(90), endAngle: .degrees(270), clockwise: false)
        }
        
        path.closeSubpath()
        return path
    }
}

struct DynamicOverlayView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                // Top Half Circle
                if UIDevice.current.userInterfaceIdiom == .pad {
                    
                }
                else {
                    HalfCircle(isTopHalf: true)
                        .fill(Color(hex: "#CAE9E2"))
                        .opacity(0.4)
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.4) // dynamic size based on screen
                        .position(x: geometry.size.width * 0, y: geometry.size.height * 0.20)
                }
                
                
                // Logo Image
                Image(.logo)
                    .scaledToFill()
                    .frame(width: geometry.size.width * 0.6) // adjust based on screen width
                    .aspectRatio(contentMode: .fit)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                // Bottom Half Circle
                HalfCircle(isTopHalf: false)
                    .fill(Color(hex: "#CAE9E2"))
                    .opacity(0.4)
                    .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.4) // dynamic size based on screen
                    .position(x: geometry.size.width * 1, y: geometry.size.height * 0.80)
            }
        }
        .edgesIgnoringSafeArea(.all) // Optional, to make sure it covers the full screen on all devices
    }
}

extension Color {
    init(hex: String) {
        let hexSanitized = hex.replacingOccurrences(of: "#", with: "")
        var hexInt: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&hexInt)
        
        let red = Double((hexInt >> 16) & 0xFF) / 255.0
        let green = Double((hexInt >> 8) & 0xFF) / 255.0
        let blue = Double(hexInt & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

/*#Preview {
    GoodZSplash()
}
*/
