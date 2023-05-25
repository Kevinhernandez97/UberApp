//
//  RideRequestView.swift
//  UberApp
//
//  Created by Kevin Hernandez on 23/05/23.
//

import SwiftUI

struct RideRequestView: View {
    @Environment(\.colorScheme) var colorSheme
    @State private var selectedRideType: RideType = .uberX
    @EnvironmentObject var locationViewModel: LocationSearchViewModel

    @State private var isPresented = false
    
    var body: some View {
        ScrollView {
            VStack {
                Capsule()
                    .foregroundColor(Color(.systemGray5))
                    .frame(width: 48, height: 6)
                    .padding()
                
                // Trip info view
                
                HStack {
                    VStack {
                        Circle()
                            .fill(Color(.systemGray3))
                            .frame(width: 8, height: 8)
                        Rectangle()
                            .fill(Color(.systemGray3))
                            .frame(width: 1, height: 32)
                        Rectangle()
                            .fill(Color(colorSheme == .dark ? .white : .black))
                            .frame(width: 8, height: 8)
                    }
                    
                    VStack(alignment: .leading, spacing: 24) {
                        HStack {
                            Text("Current location")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.gray)
                            Text("")
                            
                            Spacer()
                            
                            Text(locationViewModel.pickupTime ?? "")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            if let location = locationViewModel.selectedUberLocation {
                                Text(location.title)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            
                            Spacer()
                            
                            Text(locationViewModel.dropOffTime ?? "")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.leading, 8)
                }
                .padding()
                
                Divider()
                    .padding([.leading, .trailing])
                
                // ride Type Selection view
                
                Text("SUGGESTED RIDIES")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(RideType.allCases) { type in
                            VStack(alignment: .leading) {
                                Image(type.imageName)
                                    .resizable()
                                    .scaledToFit()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(type.description)
                                        .font(.system(size: 14, weight: .semibold))
                                        .padding(.leading, 4)
                                    
                                    Text(locationViewModel.computeRidePrice(forType: type).toCurrency())
                                        .font(.system(size: 14, weight: .semibold))
                                        .padding(.leading, 4)
                                }
                                .padding(8)
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedRideType = type
                                }
                            }
                            .frame(width: 112, height: 140)
                            .foregroundColor(type == selectedRideType || colorSheme == .dark ? .white : .black)
                            .background(Color(type == selectedRideType ? .systemBlue : .systemGray5))
                            .scaleEffect(type == selectedRideType ? 1.15 : 1.0)
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.vertical, 8)
                
                // payment option view
  
                HStack(spacing: 12) {
                    Text("Visa")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(6)
                        .background(.blue)
                        .cornerRadius(4)
                        .foregroundColor(.white)
                        .padding(.leading)

                    Text("**** 1234")
                        .fontWeight(.bold)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .imageScale(.medium)
                        .padding()
                }
                .frame(height: 50)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal)
                .onTapGesture {
                    isPresented = true
                }
                .sheet(isPresented: $isPresented) {
                    FullScreenView()
                }
                
                // request ride button
                
                Button {
                    
                } label: {
                    Text("CONFIRM RIDE")
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 24)
            .background(Color(.systemGroupedBackground))
            .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
        }
        .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
        .frame(height: 400)
    }
}

struct FullScreenView: View {
    var body: some View {
        NavigationView {
            Button("Vista") {
                
            }
        }
        .toolbar {
            Button("Back") {
                
            }
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        return Path(path.cgPath)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
