--[[ Copyright (C) 2018 Google Inc.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
]]

local make_map = require 'common.make_map'
local pickups = require 'common.pickups'
local custom_observations = require 'decorators.custom_observations'
local game = require 'dmlab.system.game'
local timeout = require 'decorators.timeout'
local api = {}
local map_maker = require 'dmlab.system.map_maker'
local random = require 'common.random'
local randomMap = random(map_maker:randomGen())
local maze_gen = require 'dmlab.system.maze_generation'
local debug_observations = require 'decorators.debug_observations'

function api:start(episode, seed)
  random:seed(seed)
  randomMap:seed(random:mapGenerationSeed())

  --read map(TEXT) from file
  f = io.open("/home/vagrant/lab/game_scripts/levels/makeNewMap/maps/maze1.txt", "r")
  map_line = ""
  for line in f:lines() do
      map_line = map_line..line
  end
 
    self._maze = maze_gen.mazeGeneration{
        entity = '[['..map_line..']]'
    }

    self._map = make_map.makeMap{
        mapName = 'WideOpenLevel',
        mapEntityLayer = self._maze:entityLayer(),
        pickups = {
            A = 'apple_reward',
            F = 'fungi_reward',
            G = 'goal',
            L = 'lemon_reward',
            M = 'mango_goal',
            S = 'strawberry_reward',
            W = 'watermelon_goal',
        }
    }

debug_observations.setMaze(self._maze)
end

function api:nextMap()
  return self._map
end

function api:updateSpawnVars(spawnVars)
  if spawnVars.classname == "info_player_start" then
    -- Spawn facing East.
    spawnVars.angle = "0"
    spawnVars.randomAngleRange = "0"
  end
  return spawnVars
end

-- `make_map` has default pickup types A = apple_reward and G = goal.
-- This callback is used to create pickups with those names.
function api:createPickup(classname)
  return pickups.defaults[classname]
end

timeout.decorate(api, 60 * 60)
custom_observations.decorate(api)

return api
