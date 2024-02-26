//
//  File.swift
//  
//
//  Created by Leen Almejarri on 15/08/1445 AH.
//

import Foundation
import Fluent

struct createUserTableMigration: AsyncMigration{
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("User")
        
            .id() // primary key
            .field("name", .string ,.required)
            .field("phone_number", .int ,.required)
           
        
        /*culomn name , data type , constraint
         مثل(.require  تشبه (NOT NULL) .reference("table name","culomn name")  تشبه (forginkey))*/
        
            .create()
    }
    
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("User")
            .delete()
    }
    
}
