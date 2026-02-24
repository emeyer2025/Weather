//
//  Weather.swift
//  DemoApp
//
//  Created by Eric Meyer on 2/24/26.
//

import SwiftUI

struct HourWeather {
    let time: String
    let icon: String
    let temp: Int
}

struct DayWeather {
    let day: String
    let icon: String
    let high: Int
    let low: Int
}
    
struct Weather: View {
    let hourlyData = [
        HourWeather(time: "5PM", icon: "cloud.sun.fill", temp: 34),
        HourWeather(time: "6PM", icon: "cloud.fill", temp: 32),
        HourWeather(time: "7PM", icon: "cloud.fill", temp: 30),
        HourWeather(time: "8PM", icon: "moon.fill", temp: 27)
    ]
    
    let dailyData = [
        DayWeather(day: "Tue", icon: "cloud.sun.fill", high: 35, low: 23),
        DayWeather(day: "Wed", icon: "cloud.fill", high: 34, low: 24),
        DayWeather(day: "Thu", icon: "cloud.fill", high: 33, low: 22),
        DayWeather(day: "Fri", icon: "cloud.sun.fill", high: 36, low: 25),
        DayWeather(day: "Sat", icon: "sun.max.fill", high: 37, low: 26)
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.blue, Color.black],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack {
                Spacer()

                VStack{
                    Text("Fallston")
                        .font(.system(size: 28, weight: .bold))
                    Text("35°")
                        .font(.system(size: 50, weight: .bold))
                    Text("Feels Like: 26°")
                        .font(.system(size: 20, weight: .bold))
                    HStack{
                        Text("H:35°")
                        Text("L: 23°")
                    }
                }
                .font(.system(size: 20, weight: .bold))
                Spacer()
                HStack(spacing: 20) {
                    ForEach(hourlyData, id: \.time) { hour in
                        VStack {
                            Text(hour.time)
                            Image(systemName: hour.icon)
                            Text("\(hour.temp)°")
                        }
                        .foregroundColor(.white)
                    }
                }
                VStack {
                    ForEach(dailyData, id: \.day) { day in
                        HStack {
                            Text(day.day)
                                .frame(width: 50, alignment: .leading)
                            
                            Image(systemName: day.icon)
                            
                            Spacer()
                            
                            Text("\(day.low)°")
                            
                            Spacer()
                            
                            Text("\(day.high)°")
                        }
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                    }
                }
                
                .padding()
                Spacer()
                
            }
            .foregroundColor(.white)

        }
    }
}
#Preview {
    Weather()
}
