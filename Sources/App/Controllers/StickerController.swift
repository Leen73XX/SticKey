//
//  StickerController.swift
//
//
//  Created by Leen Almejarri on 10/08/1445 AH.
//

import Fluent
import Vapor

struct StickerController: RouteCollection{
    
    // init func  اول حاجة بتطلع
    func boot(routes: Vapor.RoutesBuilder) throws {
        let sticker = routes.grouped("sticker") // http://127.0.0.1:8080/sticker  -> لو كتبتها في postman بيطلع ( [] )
        sticker.get(use: index)
        sticker.post(use: create)
        
    }
    
    func index (req: Request) throws -> EventLoopFuture<[Stickers]>{ 
        return Stickers.query(on: req.db).all()                   // return everything back frome this query
    }
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let sticker = try req.content.decode(Stickers.self) // يحول جيسون الى النوع حقنا
        return sticker.save(on: req.db).transform(to: .ok)
    }
    
}
