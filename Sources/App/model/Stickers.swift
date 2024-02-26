//
//  File.swift
//  
//
//  Created by Leen Almejarri on 09/08/1445 AH.
//

import Fluent
import Vapor

// 2nd step
//  بالمودل table نمثل
// @ هذي تسوي matching مع migration (1st step)

final class Stickers: Model, Content{
    static let schema: String = "sticker" // table name
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name : String
    
    @Field(key: "price")
    var price : Int
    
    @Field(key: "image")
    var image : String
    
    init(){
        
    }
    init(id: UUID? = nil, name:String, price : Int, image : String){
        self.id = id
        self.name = name
        self.price = price
        self.image = image
    }
}
