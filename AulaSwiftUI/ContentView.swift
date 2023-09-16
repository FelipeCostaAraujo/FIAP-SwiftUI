//
//  ContentView.swift
//  AulaSwiftUI
//
//  Created by Felipe C. Araujo on 16/09/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeaderView()
                HStack {
                    PriceView(title: "Basic",
                              price: "$9",
                              textColor: .white,
                              bgColor: .purple)
                    
                    PriceView(title: "Pro",
                              price: "$19",
                              textColor: .black,
                              bgColor: Color.init(white: 0.9),
                              subTitle: "Best for designer"
                    )
                }
                
                PriceView(title: "Team",
                          price: "$299",
                          textColor: .white,
                          bgColor: Color.init(white: 0.3),
                          subTitle: "Perfect for teams with 20 members",
                          icon: "wand.and.rays"
                )
                .padding(.top, 8)
                
                Spacer()
            }
            .padding()
        }
       
    }
}

struct PriceView: View {
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var subTitle: String?
    var icon: String?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                if let icon {
                    Image(systemName: icon)
                        .font(.largeTitle)
                        .foregroundColor(textColor)
                }
                Text(title)
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(textColor)
                Text(price)
                    .foregroundColor(textColor)
                    .font(.system(size: 40,weight: .heavy,design: .rounded))
                Text("per month")
                    .font(.headline)
                    .foregroundColor(textColor)
            }
            .frame(minWidth: 0,maxWidth: .infinity)
            .padding(40)
            .background(bgColor)
            .foregroundColor(.black)
            .cornerRadius(10)
            
            if let subTitle {
                Text(subTitle)
                    .font(.system(.caption,design: .rounded))
                    .foregroundColor(.white)
                    .padding(5)
                    .background(.yellow)
                    .cornerRadius(6)
                    .offset(y: 10)
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle,design: .rounded))
                    .fontWeight(.bold)
                Text("Your plan")
            }
            .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
            //.background(Color.blue)
            
            //Spacer()
        }
    }
}

struct DogView: View {
    var body: some View {
        VStack {
            Image("dog")
                .resizable()
                .scaledToFit()
            Image(systemName: "globe")
                .font(.system(size: 90))
                .foregroundColor(.indigo)
            
            Text("Olá **mundo* Clique [aqui](https://google.com)")
                .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
