//
//  EndpointConfigSpec.swift
//  ReSwiftStarWarsTests
//
//  Created by James Rochabrun on 1/28/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import ReSwiftStarWars

class EndpointConfigSpec: QuickSpec {
    
    override func spec() {
        var subject: StarWars!
        describe("Itunes") {
            beforeEach {
                subject = StarWars.films
                //                /// this is like calling viewdidload
                //                _ = subject.view
            }
            context("Just by passing this cases") {
                it("will look equal") {
                    expect(String(describing:subject.request)).to(equal("http://swapi.co/api/films?"))
                }
            }
        }
    }
}
