--[[
More Blocks: registrations

Copyright (c) 2011-2017 Hugo Locurcio and contributors.
Licensed under the zlib license. See LICENSE.md for more information.
--]]

local default_nodes = { -- Default stairs/slabs/panels/microblocks:
	"default:stone",
	"default:stone_block",
	"default:cobble",
	"default:mossycobble",
	"default:brick",
	"default:sandstone",
	"default:steelblock",
	"default:goldblock",
	"default:copperblock",
	"default:bronzeblock",
	"default:diamondblock",
	"default:tinblock",
	"default:desert_stone",
	"default:desert_stone_block",
	"default:desert_cobble",
	"default:meselamp",
	"default:glass",
	"default:tree",
	"default:wood",
	"default:jungletree",
	"default:junglewood",
	"default:pine_tree",
	"default:pine_wood",
	"default:acacia_tree",
	"default:acacia_wood",
	"default:aspen_tree",
	"default:aspen_wood",
	"default:obsidian",
	"default:obsidian_block",
	"default:obsidianbrick",
	"default:obsidian_glass",
	"default:stonebrick",
	"default:desert_stonebrick",
	"default:sandstonebrick",
	"default:silver_sandstone",
	"default:silver_sandstone_brick",
	"default:silver_sandstone_block",
	"default:desert_sandstone",
	"default:desert_sandstone_brick",
	"default:desert_sandstone_block",
	"default:sandstone_block",
	"default:coral_skeleton",
	"farming:straw"
}

for _, nodename in pairs(default_nodes) do	
	local mod, name = nodename:match("(.*):(.*)")
	local ndef = minetest.registered_nodes[nodename]
	if ndef then
		local drop
		if type(ndef.drop) == "string" then
			drop = ndef.drop:sub(mod:len()+2)
		end

		local tiles = ndef.tiles
		if #ndef.tiles > 1 and ndef.drawtype:find("glass") then
			tiles = { ndef.tiles[1] }
		end

		stairsplus:register_all("moreblocks", name, nodename, {
			description = ndef.description,
			drop = drop,
			groups = ndef.groups,
			sounds = ndef.sounds,
			tiles = tiles,
			sunlight_propagates = true,
			light_source = ndef.light_source
		})
		stairsplus:register_xdecor_alias_all(mod, name, "moreblocks", name, false)
	end
end

-- wool registrations

if minetest.get_modpath("wool") then

	local colorlist = {
		{"white",      "White Wool"},
		{"grey",       "Grey Wool"},
		{"black",      "Black Wool"},
		{"red",        "Red Wool"},
		{"yellow",     "Yellow Wool"},
		{"green",      "Green Wool"},
		{"cyan",       "Cyan Wool"},
		{"blue",       "Blue Wool"},
		{"magenta",    "Magenta Wool"},
		{"orange",     "Orange Wool"},
		{"violet",     "Violet Wool"},
		{"brown",      "Brown Wool"},
		{"pink",       "Pink Wool"},
		{"dark_grey",  "Dark Grey Wool"},
		{"dark_green", "Dark Green Wool"},
	}

	for i in ipairs(colorlist) do
		local color = colorlist[i][1]
		local colordesc = colorlist[i][2]
		
		stairsplus:register_all("wool", color, "wool:"..color, {
			description = colordesc,
			tiles = {"wool_"..color..".png"},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,
					flammable=3,wool=1,not_in_creative_inventory=1},
			sounds = default.node_sound_defaults(),
			sunlight_propagates = true,
		})
	end
end
