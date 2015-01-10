###
Crafting Guide - item_page_controller.coffee

Copyright (c) 2014-2015 by Redwood Labs
All rights reserved.
###

BaseController          = require './base_controller'
CraftingTableController = require './crafting_table_controller'
ImageLoader             = require './image_loader'
InventoryController     = require './inventory_controller'
ItemPage                = require '../models/item_page'
ModPackController       = require './mod_pack_controller'

########################################################################################################################

module.exports = class ItemPageController extends BaseController

    constructor: (options={})->
        options.model        ?= new ItemPage
        options.imageLoader  ?= new ImageLoader defaultUrl:'/images/unknown.png'
        options.templateName  = 'item_page'
        super options

    # BaseController Overrides #####################################################################

    onDidRender: ->
        @haveController = @addChild InventoryController, '.have',
            editable:    true,
            imageLoader: @imageLoader
            model:       @model.plan.have,
            modPack:     @model.modPack,
            title:       'Items you have'

        @wantController = @addChild InventoryController, '.want',
            editable:    true
            icon:        '/images/fishing_rod.png',
            imageLoader: @imageLoader
            model:       @model.plan.want,
            modPack:     @model.modPack,
            title:       'Items you want'

        @needController = @addChild InventoryController, '.need',
            editable:    false
            icon:        '/images/boots.png',
            imageLoader: @imageLoader
            model:       @model.plan.need,
            modPack:     @model.modPack,
            title:       "Items you'll need"

        @craftingTableController = @addChild CraftingTableController, '.view__crafting_table',
            model: @model.table
            modPack: @model.modPack

        @modPackController = @addChild ModPackController, '.view__mod_pack', model:@model.modPack
        super