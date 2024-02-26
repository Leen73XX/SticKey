import Fluent
import Vapor

func routes(_ app: Application) async throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    try app.register(collection: StickerController()) // to call sticker controller
    try app.register(collection: UserController())
    try app.register(collection: OrderController())
//    //migration
//    app .migrations.add(CreateStickerTableMigration())
//    try await app.autoMigrate()
    
    
}


