//
//  ContentView.swift
//  Calculadora
//
//  Created by Eduardo Cortez on 10 Dec 23.
//

import SwiftUI

struct ContentView: View {
    
    let numberColor = Color.teal
    let symbolColor = Color.yellow
    let equalColor = Color.orange
    
    @State private var display = ""
    
    struct CalculatorButton: View {
        let info: String
        let color: Color
        let action: () -> Void
        
        init(info: String, color: Color, action: @escaping () -> Void) {
            self.info = info
            self.color = color
            self.action = action
        }
        
        
        var body: some View {
            Button(action: {self.action()}) {
                Text(info)
                    .font(.title)
                    .frame(width: 70, height: 70)
                    .background(color)
                    .foregroundColor(.white)
                    .cornerRadius(35)
            }
        }
    }
    
    private func showOnDisplay (_ value: String) {
        display = display + value
    }
    
    private func calculate() {
        let expression = NSExpression(format: display)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            display = "\(result)"
        } else {
            display = "Error"
        }
    }
    
    var body: some View {
        VStack() {
          
            Text(display)
                .font(.system(size: 40))
                .frame(height: 150)
            
            
            HStack{
                CalculatorButton(info: "7", color: numberColor, action: {showOnDisplay("7")})
                CalculatorButton(info: "8", color: numberColor, action: {showOnDisplay("8")})
                CalculatorButton(info: "9", color: numberColor, action: {showOnDisplay("9")})
                CalculatorButton(info: "➗", color: symbolColor, action: {showOnDisplay("/")})
            }
            
            HStack{
                CalculatorButton(info: "4", color: numberColor, action: {showOnDisplay("4")})
                CalculatorButton(info: "5", color: numberColor, action: {showOnDisplay("5")})
                CalculatorButton(info: "6", color: numberColor, action: {showOnDisplay("6")})
                CalculatorButton(info: "✖️", color: symbolColor, action: {showOnDisplay("*")})
                
            }
            
            HStack{
                CalculatorButton(info: "1", color: numberColor, action: {showOnDisplay("1")})
                CalculatorButton(info: "2", color: numberColor, action: {showOnDisplay("2")})
                CalculatorButton(info: "3", color: numberColor, action: {showOnDisplay("3")})
                CalculatorButton(info: "➖", color: symbolColor, action: {showOnDisplay("-")})
                
            }
            
            HStack{
                CalculatorButton(info: "0", color: numberColor, action: {showOnDisplay("0")})
                CalculatorButton(info: ".", color: numberColor, action: {showOnDisplay(".")})
                CalculatorButton(info: "🟰", color: equalColor, action: {calculate()})
                CalculatorButton(info: "➕", color: symbolColor, action: {showOnDisplay("+")})
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
