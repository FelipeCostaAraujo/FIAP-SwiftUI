//
//  AnimationView.swift
//  AulaSwiftUI
//
//  Created by Felipe C. Araujo on 16/09/23.
//

import SwiftUI


@propertyWrapper
struct Caps: DynamicProperty {
    var value: String = ""
    var wrappedValue: String {
        get {
            value
        }
        set {
            value = newValue.uppercased()
        }
    }
}

struct Teste {
    @Caps var name:String
}

struct AnimationView: View {
    @State private var circleColorChanged: Bool = false
    @State private var recordBegin: Bool = false
    @State private var recording: Bool = false
    
    var body: some View {
        VStack {
            Button {
                print("click")
            } label: {
                Label {
                    Text("Oi, sou um botão")
                } icon: {
                    Image(systemName: "globe")
                }
                  
            }
            .buttonStyle(GradientBackgroundStyle())

            Image(systemName: "heart.fill")
                .font(.system(size: 120))
                .frame(width: 200,height: 200)
                .foregroundColor(circleColorChanged ? .red : .gray)
                .scaleEffect(circleColorChanged ? 1.5 : 1.0)
                .animation(.easeIn, value: circleColorChanged)
                .onTapGesture {
                    circleColorChanged.toggle()
                }
            ZStack {
                RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                    .frame(width: recordBegin ? 60 : 250, height: 60)
                    .foregroundColor(recordBegin ? .red : .green)
                    .overlay {
                        Image(systemName: "mic.fill")
                            .font(.system(.title))
                            .foregroundColor(.white)
                            .scaleEffect(recording ? 0.7 : 1.0)
                    }
                RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                    .trim(from: 0,to: recordBegin ? 0.0000001 : 1)
                    .stroke(lineWidth: 5)
                    .frame(width: recordBegin ? 70 : 260, height: 70)
                    .foregroundColor(.green)
            
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    recordBegin.toggle()
                }
                withAnimation(.spring().repeatForever().delay(0.5)) {
                    recording.toggle()
                }
            }
        }
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0,maxWidth: .infinity)
            .foregroundColor(.white)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow, Color.orange]),
                    startPoint: .leading,
                    endPoint: .trailing)
            )
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
