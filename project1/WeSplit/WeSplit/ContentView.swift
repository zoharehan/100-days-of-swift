//
//  ContentView.swift
//  WeSplit
//
//  Created by Zoha Rehan on 2023-07-15.
//

// Notes from the project Introduction.

// Form: view type that allows for user input.
// If more than 10 elements are used in a form, they need to be placed in a "Group."
// If these elements need to be split, they can be places under "Section"s.

// Safe area: Where your content won't be covered by anything else.

// Wrapping your content in a "NavigationView" tag creates a navbar.
// nabar modifiers: .navigationTitle("SwiftUI")
//.navigationBarTitleDisplayMode(.inline)

// A mutating function can't be included in a struct since they could be initialised to be constant. Therefore, methods that change include value-changing can't be used in the ContentView struct. In order to do this, we need property wrappers such as: "@State"
// Note: apple recommends using a private access tag with states.

// forEach is useful in making lists, especially within the Picker view. Day 16 has an example.

// Challenge
//One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on:
//Add a header to the third section, saying “Amount per person”
//Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.
//Change the tip percentage picker to show a new screen rather than using a segmented control, and give it a wider range of options – everything from 0% to 100%. Tip: use the range 0..<101 for your range rather than a fixed array.

import SwiftUI

// the struct conforms the the "View" protocol and returns an object that conforms to the same protocol.
struct ContentView: View {
    //  Default values for our user inputs.
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    //     people often choose from given tipping options
    let tipPercentages = [10, 15, 20, 25, 0]
    
//    the total each person needs to pay is a computed property.
    var totalPerPerson: Double {
        // calculate the total per person here
//         the +2 happens because numberOfPeople saves the option number and option 0 is 2 people -> we're off by 2.
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var grandTotal: Double {
        return checkAmount + (checkAmount/100 * Double(tipPercentage))
    }
//     to make keyboard disappear
    @FocusState private var amountIsFocused: Bool
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    //            Just the following does not work because we can't convert from double to string within the text argument.
                    //            TextField("Amount", text: $checkAmount)
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }.keyboardType(.decimalPad).focused($amountIsFocused)
                
                
                Section {
                    //            Just the following does not work because we can't convert from double to string within the text argument.
                    //            TextField("Amount", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
//              a header is a good way to add a "heading" or explanation without making it look too big or like a title.
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                    Challenge from project3: adding a conditional modifier to change the text colour to red if the user selects 0% tip.
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                } header: {
                    Text("Total with Tip")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
            }.navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                        
                }
            }}}
    
    struct ContentView_Previews: PreviewProvider {
        
        static var previews: some View {
            ContentView()
        }
    }
}
