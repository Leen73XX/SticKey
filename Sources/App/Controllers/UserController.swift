//
//  StickerController.swift
//
//
//  Created by Leen Almejarri on 10/08/1445 AH.
//

import Fluent
import Vapor

struct UserController: RouteCollection{
    
    // init func  اول حاجة بتطلع
    func boot(routes: Vapor.RoutesBuilder) throws {
        let user = routes.grouped("User") // http://127.0.0.1:8080/User  -> لو كتبتها في postman بيطلع ( [] )
        user.get(use: index)
        user.post(use: create)
    }
    
    func index (req: Request) throws -> EventLoopFuture<[User]>{
        return User.query(on: req.db).all()                   // return everything back frome this query
    }
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let user = try req.content.decode(User.self) // يحول جيسون الى النوع حقنا
        return user.save(on: req.db).transform(to: .ok)
    }
}
