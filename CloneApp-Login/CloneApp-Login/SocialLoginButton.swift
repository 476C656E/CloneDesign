//
//  SocialLoginButton.swift
//  CloneApp-Login
//
//  Created by Whiskey on 2022/12/19.
//

import SwiftUI


//extension ButtonStyleConfiguration {
//    func customBody() -> some View {
//        self.label
//            .frame(width: 300, height: 25)
//            .cornerRadius(10)
//            .padding()
//            .scaleEffect(self.isPressed ? 1.1 : 1)
//            .animation(.easeOut(duration: 0.2), value: self.isPressed)
//    }
//}

// MARK: - Button Style
struct SocialButtonStyle: ButtonStyle {
    let buttonColor: Color
    let textColor: Color
    let cornerRadius: CGFloat = 10.0
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20).bold())
            .frame(width: 300, height: 25)
            .padding()
            .foregroundColor(textColor)
            .background(buttonColor)
            .cornerRadius(cornerRadius)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
struct ButtonView: View {
    
    var body: some View {
        Button("Apple Login") {
            print("Apple btn Pressed!")
        }
        .buttonStyle(SocialButtonStyle(buttonColor: .black, textColor: .white))
        
        Button("Kakao Login") {
            print("kakao btn Pressed!")
        }
        .buttonStyle(SocialButtonStyle(buttonColor: .yellow, textColor: .black))
        .padding(.bottom)
        Divider()
            .frame(maxWidth: 330)
    }
}

struct SocialLoginButton: View {
    @State var username: String = ""
    @State var animation: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            
            Text("시작하기")
                .font(.title2)
                .bold()
                .padding([.bottom, .leading])
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ButtonView()
            
            VStack(alignment: .leading) {
                Text("이메일")
                    .font(.callout)
                    .padding(.top)
                TextField("email@example.com", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding([.leading, .trailing, .top])
            
            Button("이메일로 계속하기") {
            }
            .padding()
            .foregroundColor(.gray)
        }
        .padding()
        .animation(.easeIn(duration: 2), value: animation)
    }
}

struct SocialLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        SocialLoginButton()
    }
}
