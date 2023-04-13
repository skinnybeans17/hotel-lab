import UIKit

class Hotel {
    let address: String
    let manager: String
    let numofRooms: Int
    
    init(address: String, manager: String, numofRooms: Int) {
        self.address = address
        self.manager = manager
        self.numofRooms = numofRooms
    }
}

enum RoomType {
    case single
    case double
    case triple
    case quad
}



class Room {
    let roomtype: RoomType
    let roomprice: Double
    let roomnumber: Int
    let alreadyBooked: Bool = false
    init(roomtype:RoomType, roomnumber:Int) {
        self.roomtype = roomtype
        self.roomnumber = roomnumber
        switch self.roomtype {
        case .single:
            self.roomprice = 10
        case .double:
            self.roomprice = 20
        case .triple:
            self.roomprice = 30
        case .quad:
            self.roomprice = 40
        }
    }
}

class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Guest:Person {
    let withPet: Bool
    init(name: String, withPet: Bool) {
        self.withPet = withPet
        super.init(name: name)
    }
}

class BookIn {
    let guest: Guest
    let room: Room
    let days: Int
    var totalPrice: Double
    init(guest: Guest, days: Int, room: Room) {
        self.guest = guest
        self.room = room
        self.days = days
        self.totalPrice = 0
        self.totalPrice = calculateAmount()
    }
    func calculateAmount() -> Double {
        var price = room.roomprice * Double(days)
        if (guest.withPet) {
            price += 25 * Double(days)
        }
        return price
    }
    func showBookIn(){
        let message = "Enjoy \(guest), your \(days) day-long trip for $\(totalPrice)!"
    }
}
