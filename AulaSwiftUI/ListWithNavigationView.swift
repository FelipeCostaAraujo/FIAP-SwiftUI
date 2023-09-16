//
//  ListWithNavigationView.swift
//  AulaSwiftUI
//
//  Created by Felipe C. Araujo on 16/09/23.
//

import SwiftUI

struct Weather: Identifiable {
    var id: UUID = UUID()
    
    let name: String
    let image: String
}

struct ListWithNavigationView: View {
    let weathers: [Weather] = [
        Weather(name: "Sunny", image: "sun.min.fill"),
        Weather(name: "Sunset", image: "sunset.fill"),
        Weather(name: "Moon", image: "moon.fill"),
        Weather(name: "Moon haze", image: "moon.haze.fill"),
        Weather(name: "Sparkle", image: "sparkles"),
        Weather(name: "Cloud fog", image: "cloud.fog.fill"),
        Weather(name: "Cloud Moon", image: "cloud.moon.fill"),
    ]
    var body: some View {
        NavigationStack {
            List(weathers) { weather in
                NavigationLink(destination: WeatherDetailView(weather: weather)) {
                    WeatherRow(weather: weather)
                        .listRowSeparator(.hidden)
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Clima")
        }
        
    }
}

struct WeatherDetailView: View {
    let weather: Weather
    var body: some View {
        Image(systemName: weather.image)
            .font(.system(size: 200))
        Text(weather.name)
            .font(.largeTitle)
            .bold()
    }
}

struct WeatherRow: View {
    let weather: Weather
    var body: some View {
        HStack {
            Image(systemName: weather.image)
            Text(weather.name)
        }
    }
}

struct ListWithNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ListWithNavigationView()
    }
}
