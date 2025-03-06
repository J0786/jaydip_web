//
//  Scrollview.swift
//  HelloWorld
//
//  Created by jaydip on 19/12/24.
//

import SwiftUI

struct VerticalScrollViewExample: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(1..<21) { index in
                    Text("Item \(index)")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationTitle("Vertical ScrollView Example")
    }
}

struct VerticalScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        VerticalScrollViewExample()
    }
}


struct HorizontalScrollViewExample: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(1..<21) { index in
                    Text("Item \(index)")
                        .font(.title)
                        .frame(width: 200, height: 200)
                        .background(Color.green.opacity(0.3))
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Horizontal ScrollView Example")
    }
}

struct HorizontalScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollViewExample()
    }
}

struct CombinedScrollViewExample: View {
    var body: some View {
        ScrollView {
            VStack {
                // Vertical ScrollView section
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(1..<6) { index in
                            Text("Horizontal \(index)")
                                .frame(width: 150, height: 150)
                                .background(Color.blue.opacity(0.3))
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                }
                
                // Vertical list section
                VStack(spacing: 20) {
                    ForEach(1..<21) { index in
                        Text("Vertical Item \(index)")
                            .font(.title)
                            .padding()
                            .background(Color.green.opacity(0.3))
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Combined ScrollView Example")
    }
}

struct CombinedScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        CombinedScrollViewExample()
    }
}

#Preview {
    VerticalScrollViewExample()
    HorizontalScrollViewExample()
    CombinedScrollViewExample()
}
