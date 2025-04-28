//
//  LoginView.swift
//  Quran
//
//  Created by Aayush Raghuvanshi on 3/27/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var animationOffset: CGFloat = 0
    
    private let primaryColor = Color(red: 0.0, green: 0.5, blue: 0.4)
    private let accentColor = Color(red: 0.8, green: 0.6, blue: 0.0)
    private let backgroundColor = Color(red: 0.95, green: 0.95, blue: 0.9)
    
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { geometry in
                    ZStack {
                        LinearGradient(
                            gradient: Gradient(colors: [backgroundColor, primaryColor.opacity(0.2)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .foregroundColor(accentColor.opacity(0.15))
                            .rotationEffect(.degrees(45))
                            .offset(x: animationOffset, y: -animationOffset)
                            .blendMode(.overlay)
                        
                        Image(systemName: "circle.hexagongrid")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 400)
                            .foregroundColor(primaryColor.opacity(0.1))
                            .rotationEffect(.degrees(-animationOffset * 0.5))
                            .offset(x: -animationOffset, y: animationOffset)
                            .blendMode(.overlay)
                    }
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                            animationOffset = 50
                        }
                    }
                }
                
                // Main content
                VStack(spacing: 30) {
                    // Logo/Title section
                    VStack(spacing: 8) {
                        Image(systemName: "book.closed.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(primaryColor)
                            .shadow(color: accentColor.opacity(0.5), radius: 8, x: 0, y: 4)
                        
                        Text("تطبيق القرآن")
                            .font(.custom("Al Qalam Quran", size: 42))
                            .fontWeight(.heavy)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [primaryColor, accentColor],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        
                        Text("Quran")
                            .font(.custom("Tajawal", size: 32))
                            .fontWeight(.semibold)
                            .foregroundColor(primaryColor.opacity(0.9))
                    }
                    .padding(.top, 40)
                    
                    // Input fields
                    VStack(spacing: 20) {
                        TextField("Enter your email", text: $viewModel.email)
                            .textFieldStyle(CustomTextFieldStyle(color: primaryColor))
                            .textContentType(.emailAddress)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .frame(width: 320)
                        
                        SecureField("Enter your password", text: $viewModel.password)
                            .textFieldStyle(CustomTextFieldStyle(color: primaryColor))
                            .frame(width: 320)
                    }
                    
                    // Error message
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.system(size: 14, weight: .medium))
                            .padding(8)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(8)
                            .transition(.opacity)
                    }
                    
                    // Buttons
                    VStack(spacing: 15) {
                        GradientButton(
                            title: "Login",
                            colors: [primaryColor, primaryColor.opacity(0.8)],
                            action: { viewModel.login() },
                            isLoading: viewModel.isLoading
                        )
                        
                        GradientButton(
                            title: "Sign Up",
                            colors: [accentColor, accentColor.opacity(0.8)],
                            action: { viewModel.signUp() },
                            isLoading: viewModel.isLoading
                        )
                    }
                    
                    // Loading indicator
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: accentColor))
                            .scaleEffect(1.5)
                            .padding()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                QuranHomeView()
            }
            .onChange(of: viewModel.isLoggedIn) { newValue in
                print("isLoggedIn changed to: \(newValue)")
            }
        }
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    let color: Color
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Color.white.opacity(0.95))
            .cornerRadius(12)
            .shadow(color: color.opacity(0.2), radius: 8, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(color.opacity(0.5), lineWidth: 1.5)
            )
            .font(.custom("Al Qalam Quran", size: 16))
            .animation(.easeInOut(duration: 0.2), value: color)
    }
}

struct GradientButton: View {
    let title: String
    let colors: [Color]
    let action: () -> Void
    let isLoading: Bool
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width: 260)
                .padding()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: colors),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: colors[0].opacity(0.4), radius: 8, x: 0, y: 4)
        }
        .disabled(isLoading)
        .scaleEffect(isLoading ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.2), value: isLoading)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
