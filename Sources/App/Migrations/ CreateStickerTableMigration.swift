//
//  File.swift
//  
//
//  Created by Leen Almejarri on 09/08/1445 AH.
//

import Foundation
import Fluent  //استخدم الفلونت في بناء table في DB

// 1st step 

struct CreateStickerTableMigration: AsyncMigration{
    // my table
    func prepare(on database: Database) async throws {
        try await database.schema("sticker")
        
            .id() // primary key
            .field("name", .string ,.required)
            .field("price", .int ,.required)
            .field("image", .string ,.required)
        
        /*culomn name , data type , constraint
         مثل(.require  تشبه (NOT NULL) .reference("table name","culomn name")  تشبه (forginkey))*/
        
            .create()
        
    }
    // the revers of prepare
    func revert(on database: Database) async throws {
        try await database.schema("sticker")
            .delete()
    }
  
}

