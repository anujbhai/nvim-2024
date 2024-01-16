return {
  {
    "echasnovski/mini.pairs",
    version = "*",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
    end,
  },
  {
    "echasnovski/mini.comment",
    config = function()
      require("mini.comment").setup({
        options = {
          custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring()
                or vim.bo.commentstring
          end,
        },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- mappings required
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", {})
      vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", {})
      vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", {})
      vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateTop<CR>", {})
    end,
  },
}
