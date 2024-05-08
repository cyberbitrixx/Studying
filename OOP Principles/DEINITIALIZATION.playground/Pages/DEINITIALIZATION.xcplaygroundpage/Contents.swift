import UIKit

// DEINITIALIZATION

// - is called before an instance is freed (which frees up the memory);
// - are available ONLY FOR CLASSES INSTANCES;
// - only ONE deinitializer is available for one Class implementation;
// - are being called automatically before freeing the instance. It's impossible to call the deinitializer manually;
// - superClass deinitializers are being inherited by it's subClasses;
// - superClass initializer is automatically being called at the end of the subClass deinitializer implementation;
// - superClass deinitializers are always being called even if the subClass doesn't have it's own deinitializer;
// - deinitializer gets access to all the properties of the class it calls since the instance won't be freed until the deinitializer was called. Deinitializer can change it's behavior based one of those properties (for example name of the file which should be closed).

// SYNTAX:
// deinit {}

// example: representing monopoly game

class Bank {
//    maximum amount of money which can be in the bank from the start
    static var coins = 10_000
    
//    function which gives a player requested amount of money if there is enough money in the bank
    static func giveMoney(requestedMoney: Int) -> Int {
//        using function "min" to compare to values
        let moneyAvailable = min(requestedMoney, coins)
        coins -= moneyAvailable
        return moneyAvailable
    }
    
    static func recieveMoney(recieved: Int) {
        self.coins += recieved
    }
}

class Player {
    var moneyInPurse = 0
    
//    fixed amount of money a player gets from the bank at the end of each game cycle
    func getMoneyPerIteration() {
        print("one cyrcle completed")
        moneyInPurse = Bank.giveMoney(requestedMoney: 200)
    }
    
//    deinitializing the instance and giving all the money back to the Bank before all the players are leaving the game
    deinit {
        print("Player left the game.")
        Bank.recieveMoney(recieved: moneyInPurse)
        print("Money in the bank: \(Bank.coins)")
    }
}

// this instance holds optional variable of type Player - player1
// optionality in that case gives us possebility niether player is in the game or not - it can exist or not amd then the instance is being freed.

func Monopoly() {
    var player1: Player? = Player()
    player1?.getMoneyPerIteration()
    Bank.coins
}

Monopoly()

Bank.coins


// even though memory in Swift is being managed automatically by ARC (automatic references counting), it can be needed/useful sometimes to manage memory manualy such as in example above.
