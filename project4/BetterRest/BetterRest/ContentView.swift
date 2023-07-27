//
//  ContentView.swift
//  BetterRest
//
//  Created by Zoha Rehan on 2023-07-25.
//

// We trained our model with a CSV file containing the following fields:

// “wake”: when the user wants to wake up. This is expressed as the number of seconds from midnight, so 8am would be 8 hours multiplied by 60 multiplied by 60, giving 28800.
// “estimatedSleep”: roughly how much sleep the user wants to have, stored as values from 4 through 12 in quarter increments.
// “coffee”: roughly how many cups of coffee the user drinks per day.

import CoreML
import SwiftUI


struct ContentView: View {
    //    to have the default wakeup time be early in the morning and not the current time.
    //    this is done by creating a new DateComponents of our own, and using Calendar.current.date(from:) to convert those components into a full date.
//    this variable is static because one property cant be used inside another since Swift does not know the order in which they'll be created.
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                }
            }.navigationTitle("BetterRest")
                .toolbar {
                    Button("Calculate", action: calculateBedtime)
//                        adding an alert to the Form which shows the predicted bedtime.
                        .alert(alertTitle, isPresented: $showingAlert) {
                        Button("OK") { }
                    } message: {
                        Text(alertMessage)
                    }
        }
            }
    }
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
//            separate hours and minutes from the date type -> convert to Double.
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
//            to give us the actual time when the person should sleep.
            let sleepTime = wakeUp - prediction.actualSleep
            
//            show the predicted sleep time in an alert.
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

