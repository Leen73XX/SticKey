//
//  File.swift
//  
//
//  Created by Leen Almejarri on 15/08/1445 AH.
//

import Foundation
import Fluent  //استخدم الفلونت في بناء table في DB

// 1st step

struct CreateOrderTableMigration: AsyncMigration{
    // my table
    func prepare(on database: Database) async throws {
        try await database.schema("order")
        
            .id() // primary key
            .field("sticker_ID", .uuid ,.references("sticker","id" ))
            .field("user_ID", .uuid ,.references("User","id" ))
        
        /*culomn name , data type , constraint
         مثل(.require  تشبه (NOT NULL) .reference("table name","culomn name")  تشبه (forginkey))*/
        
            .create()
        
    }
    // the revers of prepare
    func revert(on database: Database) async throws {
        try await database.schema("order")
            .delete()
    }
  
}
