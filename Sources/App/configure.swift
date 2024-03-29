import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "postgres",
        password: Environment.get("DATABASE_PASSWORD") ?? "",
        database: Environment.get("DATABASE_NAME") ?? "stickey_app",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)
    
    app.migrations.add(createUserTableMigration())
    app.migrations.add(CreateStickerTableMigration())
    app.migrations.add(CreateOrderTableMigration())
    try await app.autoMigrate()
    
   
    
//    try app.autoMigrate().wait()    // to run all migrations we have
    // register routes
    try await routes(app)
}
