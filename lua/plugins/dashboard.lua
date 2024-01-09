return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    --    dashboard.section.header.val = {
    --      [[                                                ]],
    --      [[    _   __                        _             ]],
    --      [[   / | / /  ___   ____  _   __   (_)   ____ ___ ]],
    --      [[  /  |/ /  / _ \ / __ \| | / /  / /   / __ `__ \]],
    --      [[ / /|  /  /  __// /_/ /| |/ /  / /   / / / / / /]],
    --      [[/_/ |_/   \___/ \____/ |___/  /_/   /_/ /_/ /_/ ]],
    --      [[                                                ]],
    --      [[                                                ]],
    --    }
    dashboard.section.header.val = {
      [[                                                 ]],
      [[                                                 ]],
      [[_____   __                     _____             ]],
      [[___  | / /_____ ______ ___   _____(_)_______ ___ ]],
      [[__   |/ / _  _ \_  __ \__ | / /__  / __  __ `__ \]],
      [[_  /|  /  /  __// /_/ /__ |/ / _  /  _  / / / / /]],
      [[/_/ |_/   \___/ \____/ _____/  /_/   /_/ /_/ /_/ ]],
      [[                                                 ]],
      [[                                                 ]],
    }

    alpha.setup(dashboard.opts)
  end,
}
