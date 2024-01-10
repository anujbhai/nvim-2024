return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle<CR>", {})
    vim.keymap.set("n", "<leader>e", ":Neotree filesystem focus<CR>", {})

    require("neo-tree").setup({
      filesystem = {
        hijack_netrw_behaviour = "open_default",
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    })
  end,
}
