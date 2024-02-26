//
//  File.swift
//  
//
//  Created by Leen Almejarri on 15/08/1445 AH.
//
// 2nd step
//  بالمودل table نمثل
// @ هذي تسوي matching مع migration (1st step)
import Fluent
import Vapor

final class Order: Model, Content{
    static let schema: String = "order" // table name
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "sticker_ID")
    var sticker_ID : UUID
    
    @Field(key: "order_ID")
    var order_ID : UUID
    
    @Parent(key: "userID") var user: User
    
    init(){
        
    }
    init(id: UUID? = nil,  sticker_ID : UUID, order_ID : UUID){
        self.id = id
        self.sticker_ID = sticker_ID
        self.order_ID = order_ID
    }
}
