//: Playground - noun: a place where people can play

import UIKit

protocol Vehicle: CustomStringConvertible {
    var isRunning: Bool{ get set }
    var make:String { get set}
    var model: String { get set }
    mutating func start()
    mutating func turnOff()
}

extension Vehicle {
    
    var makeModel: String {
        return "\(make) \(model)"
    }
    
    mutating func start(){
        if isRunning {
            print("Already Started")
        }else {
            isRunning = true
            print("\(self.description) fired up!")
        }
    }
    
    mutating func turnOff(){
        if isRunning{
            isRunning = false
            print("\(self.description) shut down!")
        }else{
            print("Already turned off")
        }
    }
    
}

struct sportsCar: Vehicle {
    
    var isRunning: Bool = false
    
    var make: String
    var model: String
    
    var description: String{
        return self.makeModel
    }

}


class truck: Vehicle {
 
    var isRunning: Bool = false
    
    var make: String
    var model: String
    
    init(isRunning: Bool, make: String, model: String){
        self.isRunning = isRunning
        self.make = make
        self.model = model
    }
    
    var description: String{
        return self.makeModel
    }
    
    func blowHorn(){
        print("PPPPPPP")
    }

}

var mycar = sportsCar(isRunning: false, make: "Tesla", model: "P100D")
var mytruck = truck(isRunning: false, make: "Nissan", model: "Monster")

//
//
var vehicleArray: Array<Vehicle> = [mycar, mytruck]

for vehicle in vehicleArray {
    print("\(vehicle.makeModel)")
}
//
mycar.start()
mytruck.start()


mytruck.blowHorn()
mycar.turnOff()
mytruck.turnOff()

extension Double {
    var dollarString: String {
        return String(format: "$%.02f", self)
    }
}

var asd = 0.21 * 13.2

asd.dollarString
