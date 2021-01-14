//
//  main.swift
//  DecoratorHomework
//
//  Created by Andrey on 13/01/2021.
//  Copyright © 2021 Andrey Anoshkin. All rights reserved.
//

import Foundation

protocol Coffee {
    var cost: Double { get }
}

class SimpleCoffee: Coffee {
    var cost: Double {
        return 20.0
    }
}


protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init(base: Coffee)
}

class Sugar: CoffeeDecorator {
    let base: Coffee
    
    var cost: Double {
        return base.cost + 5.0
    }
    
    required init(base: Coffee) {
        self.base = base
    }
}

class Milk: CoffeeDecorator {
    let base: Coffee
    
    var cost: Double {
        return base.cost + 10.0
    }
    
    required init(base: Coffee) {
        self.base = base
    }
}

class WhippedCream: CoffeeDecorator {
    let base: Coffee
    
    var cost: Double {
        return base.cost + 20.0
    }
    
    required init(base: Coffee) {
        self.base = base
    }
}

let simpleCoffee = SimpleCoffee()
let coffeeWithSugar = Sugar(base: simpleCoffee)
let coffeeWithSugarAndMilk = Milk(base: coffeeWithSugar)
let coffeeWithWhippedCream = WhippedCream(base: simpleCoffee)

print("simpleCoffee.cost", simpleCoffee.cost) // 20.0
print("coffeeWithSugar.cost", coffeeWithSugar.cost) // 25.0
print("coffeeWithSugarAndMilk.cost", coffeeWithSugarAndMilk.cost) // 35.0
print("coffeeWithWhippedCream.cost", coffeeWithWhippedCream.cost) // 40.0

