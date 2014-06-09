data:extend({
  {
    type = "technology",
    name = "poison-1",
    icon = "__poison_ammo__/graphics/icons/poison.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "poison-basic-bullet-magazine"
      },
      {
        type = "unlock-recipe",
        recipe = "poison-piercing-bullet-magazine"
      },
      {
        type = "unlock-recipe",
        recipe = "poison-shotgun-shell"
      }
    },
    prerequisites = {"military-3"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2}
      },
      time = 30
    },
    order = "e-a-d"
  },
  {
    type = "technology",
    name = "poison-2",
    icon = "__poison_ammo__/graphics/icons/poison.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "poison-rocket"
      },
    },
    prerequisites = {"military-3", "poison-1", "explosive-rocketry"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "e-a-d"
  },
  {
    type = "technology",
    name = "poison-3",
    icon = "__poison_ammo__/graphics/icons/poison.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "poison-piercing-shotgun-shell"
      },
    },
    prerequisites = {"military-4", "poison-1"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 2},
      },
      time = 30
    },
    order = "e-a-d"
  },
})