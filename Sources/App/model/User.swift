//
//  File.swift
//  
//
//  Created by Leen Almejarri on 15/08/1445 AH.
//


import Fluent
import Vapor

// 2nd step
//  بالمودل table نمثل
// @ هذي تسوي matching مع migration (1st step)

final class User: Model, Content{
    static let schema: String = "User" // table name
    
    
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name : String
    
    @Field(key: "phone_number")
    var phone_number : Int
    @Parent(key: "user_ID") var order: Order
    
    init(){
        
    }
    init(id: UUID? = nil, name:String, phone_number : Int){
        self.id = id
        self.name = name
        self.phone_number = phone_number
      
    }
}

