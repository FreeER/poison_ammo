function ntimes(n, table)
  local i
  local ret = {}

  for i = 1, n do
    ret[#ret + 1] = table
  end

  return ret
end

data:extend({
  {
    type = "ammo",
    name = "poison-basic-bullet-magazine",
    icon = "__poison_ammo__/graphics/icons/poison-basic-bullet-magazine.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-gunshot"
                },
                {
                  type = "damage",
                  damage = { amount = 2 , type = "physical"}
                },
                {
                  type = "create-entity",
                  entity_name = "tiny-poison-cloud"
                }
              }
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "f-a-a",
    stack_size = 100
  },
  {
    type = "ammo",
    name = "poison-piercing-bullet-magazine",
    icon = "__poison_ammo__/graphics/icons/poison-piercing-bullet-magazine.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
              type = "create-entity",
              entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-gunshot"
            },
            {
              type = "damage",
              damage = { amount = 5 , type = "physical"}
            },
            {
              type = "create-entity",
              entity_name = "tiny-poison-cloud"
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "f-a-c",
    stack_size = 100
  },
  {
    type = "ammo",
    name = "poison-rocket",
    icon = "__poison_ammo__/graphics/icons/poison-rocket.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "rocket",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "poison-rocket",
          starting_speed = 0.1,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "f-b-b",
    stack_size = 100
  },
  {
    type = "ammo",
    name = "poison-shotgun-shell",
    icon = "__poison_ammo__/graphics/icons/poison-shotgun-shells.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "shotgun-shell",
      target_type = "direction",
      source_effects =
      {
        type = "create-entity",
        entity_name = "explosion-gunshot"
      },
      action = ntimes(12,
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "poison-shotgun-pellet",
            starting_speed = 1,
            direction_deviation = 0.3,
            range_deviation = 0.3,
            max_range = 15,
          }
        })
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "f-d-a",
    stack_size = 100
  },
  {
    type = "ammo",
    name = "poison-piercing-shotgun-shell",
    icon = "__poison_ammo__/graphics/icons/poison-piercing-shotgun-shells.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "shotgun-shell",
      target_type = "direction",
      source_effects =
      {
        type = "create-entity",
        entity_name = "explosion-gunshot"
      },
      action = ntimes(16,
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "poison-piercing-shotgun-pellet",
            starting_speed = 1,
            direction_deviation = 0.3,
            range_deviation = 0.3,
            max_range = 15,
          }
        })
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "f-d-a",
    stack_size = 100
  },
  {
    type = "projectile",
    name = "poison-rocket",
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "create-entity",
            entity_name = "poison-cloud"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              perimeter = 6,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 10, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            },
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 1,
      frame_width = 10,
      frame_height = 30,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      frame_width = 10,
      frame_height = 30,
      priority = "high"
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 0},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  },
  {
    type = "projectile",
    name = "poison-shotgun-pellet",
    collision_box = {{-0.05, -1}, {0.05, 1}},
    acceleration = 0,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion-gunshot"
          },
          {
            type = "damage",
            damage = { amount = 4 , type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "tiny-poison-cloud"
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      frame_width = 3,
      frame_height = 50,
      priority = "high"
    },
  },
  {
    type = "projectile",
    name = "poison-piercing-shotgun-pellet",
    collision_box = {{-0.05, -1}, {0.05, 1}},
    acceleration = 0,
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion-gunshot"
          },
          {
            type = "damage",
            damage = { amount = 6 , type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "tiny-poison-cloud"
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/piercing-bullet/piercing-bullet.png",
      frame_count = 1,
      frame_width = 3,
      frame_height = 50,
      priority = "high"
    },
  },
  {
    type = "smoke",
    name = "tiny-poison-cloud",
    animation =
    {
      filename = "__base__/graphics/entity/cloud/cloud-45-frames.png",
      priority = "low",
      frame_width = 256,
      frame_height = 256,
      frame_count = 45,
      animation_speed = 3,
      line_length = 7,
      scale = 0.5,
    },
    slow_down_factor = 0,
    wind_speed_factor = 0,
    cyclic = true,
    duration = 60 * 3,
    fade_away_duration = 3 / 10 * 60,
    spread_duration = 11,
    color = { r = 0.2, g = 0.9, b = 0.2 },
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            perimeter = 1,
            entity_flags = {"breaths-air"},
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 4, type = "poison"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
})
