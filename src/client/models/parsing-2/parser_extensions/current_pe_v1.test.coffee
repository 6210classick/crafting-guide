#
# Crafting Guide - current_pe_v1.test.coffee
#
# Copyright © 2014-2016 by Redwood Labs
# All rights reserved.
#

CurrentParserExtensionV1 = require './current_pe_v1'
ParserState              = require '../parser_state'

########################################################################################################################

parser = state = null

########################################################################################################################

describe 'current_pe_v1.coffee', ->

    beforeEach ->
        state = new ParserState
        parser = new CurrentParserExtensionV1 state

        state.create {}, 'alpha'

    describe 'documentationUrl', ->

        it 'assigns to the current object', ->
            parser.execute name:'documentationUrl', argText:'bravo'
                .then ->
                    state.getCurrent().documentationUrl.should.equal 'bravo'
                    state.errors.should.eql []

    describe 'description', ->

        it 'assigns to the current object', ->
            parser.execute name:'description', argText:'bravo'
                .then ->
                    state.getCurrent().description.should.equal 'bravo'
                    state.errors.should.eql []

    describe 'name', ->

        it 'assigns to the current object', ->
            parser.execute name:'name', argText:'bravo'
                .then ->
                    state.getCurrent().name.should.equal 'bravo'
                    state.errors.should.eql []