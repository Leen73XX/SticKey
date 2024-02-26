//
//  StickerController.swift
//
//
//  Created by Leen Almejarri on 10/08/1445 AH.
//

import Fluent
import Vapor

struct OrderController: RouteCollection{
    
    // init func  اول حاجة بتطلع
    func boot(routes: Vapor.RoutesBuilder) throws {
        let order = routes.grouped("order") // http://127.0.0.1:8080/order  -> لو كتبتها في postman بيطلع ( [] )
        order.get(use: index)
        order.post(use: create)
        order.delete(use: delete)
    }
    
    func index (req: Request) throws -> EventLoopFuture<[Order]>{
        return Order.query(on: req.db).all()                   // return everything back frome this query
    }
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let order = try req.content.decode(Order.self) // يحول جيسون الى النوع حقنا
        return order.save(on: req.db).transform(to: .ok)
    }
    func delete (req: Request)async throws -> Order{
        let order = try await Order.find(req.parameters.get("id"), on : req.db)
        guard let order else { throw Abort(.notFound)
        }
        try await order.delete(on: req.db)
        return order
    }
}
