//: [Previous](@previous)

import Foundation

// DEINITIALIZATION
// - is used to free up space wneh instance is already used and needs to be freed;
// - only one deinitializer is available for one class;
// - deinitializers are only available for classes;
// - superClass deinitializers are being inherited by it's subClasses;
// - deinitializers are being called automatically before freeing the insatance. It's imposiible to call the deinitializer manually;
// - superClass deinitializer will be inherited by it's subClasses even if they don't have it's own deinitializers;
// - deinitializer gets access to all the properties and methods it's class calls since the instance won't be freed antil deinitializer is called. Deinitializer can change it's behavior according to properties (for example the name of the file which needs to be closed by deinitializer).

// representing a monopoly game
class Bank {
    static var coins = 10_000
    
    static func giveMoney(moneyRequested: Int) -> Int {
        let moneyAvailable = min(coins, moneyRequested)
        coins -= moneyAvailable
        return moneyAvailable
    }
    
//    put money back to the bank
    static func getMoney(recieved: Int) {
        coins += recieved
    }
}

// class which represents a player
class Player {
    var moneyInPurse = 0
    
    func getMoneyPerIteration() {
        print("cycle completed.")
        moneyInPurse = Bank.giveMoney(moneyRequested: 200)
    }
    
    deinit {
        print("player left the game.")
        Bank.getMoney(recieved: moneyInPurse)
        print("money in the bank: \(Bank.coins)")
    }
}

func monopoly() {
    var player1: Player? = Player()
    player1?.getMoneyPerIteration()
    Bank.coins
}

monopoly()



//: [Next](@next)
