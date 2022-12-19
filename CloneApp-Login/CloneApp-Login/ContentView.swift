//
//  ContentView.swift
//  CloneApp-Login
//
//  Created by Glen on 2022/12/19.
//

import SwiftUI

struct SubView: View {
    @Binding var isToggle: Bool
    
    var body: some View {
        VStack {
            Button {
                isToggle.toggle()
            } label: {
                ZStack {
                    Rectangle()
                        .frame(maxWidth: 30, maxHeight: 30)
                        .cornerRadius(15)
                        .foregroundColor(.gray)
                    Image(systemName: "xmark")
                        .tint(.white)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .leading])
                Spacer()
            SocialLoginButton()
                .animation(.easeIn.delay(3), value: isToggle)
        }
    }
}

struct MainView: View {
    @Binding var isToggleOn: Bool
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            TabView {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 300, height: 300)
                
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 300, height: 300)
            }
        
    
            VStack() {
                Spacer()
                
                Text("가나다라")
                    .padding(.leading)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                Text("가나다라마바사 ABCDEFG가나다라마바사 ABCDEFG")
                    .padding(.leading)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(maxHeight: 250)
                
                Button {
                    isToggleOn.toggle()
                } label: {
                    Text("시작하기")
                            .foregroundColor(.white)
                            .padding()
                            .background(Rectangle()
                                .fill()
                                .frame(minWidth: 330, maxHeight: 50)
                                .cornerRadius(10)
                            )
                    }.padding(.bottom)
            }.padding()
            Spacer()
        }
        .animation(.spring(), value: isToggleOn)
    }
}

struct ContentView: View {
    @State var isToggle: Bool = false
    
    var body: some View {
        VStack {
            if isToggle == false {
                
                MainView(isToggleOn: $isToggle)
                    .transition(.scale)
            } else {
                SubView(isToggle: $isToggle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
