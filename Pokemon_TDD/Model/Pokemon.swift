//
//  Pokemon.swift
//  Pokemon_TDD
//
//  Created by Shawn Li on 6/4/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class Pokemon: Decodable
{
    var description: String = ""
    var height: Int = 0
    var id: Int = 0
    var imageUrl: URL?
    var name: String = ""
    var type: String = ""
    var weight: Int = 0
}

struct Profile: Decodable
{
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: URL
}

struct ProfileData: Decodable
{
    var data: [Profile]
}
