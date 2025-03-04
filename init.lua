-- Disable mouse and arrow keys
vim.o.mouse = ""
vim.api.nvim_set_keymap("n", "<Up>", ":echo 'Use k!'<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Down>", ":echo 'Use j!'<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Left>", ":echo 'Use h!'<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Right>", ":echo 'Use l!'<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })

vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>nl", "a<CR><Tab><Tab><Esc>O", { noremap = true, silent = true })
-- UI Improvements
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Relative line numbers for fast movement
vim.o.wrap = false -- Disable line wrapping
vim.o.termguicolors = true -- Enable true colors
vim.o.signcolumn = "yes" -- Always show sign column
vim.o.cursorline = true -- Highlight current line

-- Tabs & Indentation
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.autoindent = true

-- Performance
vim.o.updatetime = 250 -- Faster updates
vim.o.timeoutlen = 500 -- Faster key mappings

-- Undo & Swap Settings
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true -- Persistent undo history
vim.o.clipboard = "unnamedplus" -- Use system clipboard

-- Leader Key
vim.g.mapleader = " " -- Space as leader key

-- Load Lazy.nvim
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")
require("lazy").setup({
    -- Colorscheme (Choose one)
    { "ellisonleao/gruvbox.nvim" }, -- Gruvbox theme

    -- Status Line
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- File Explorer
    { "nvim-tree/nvim-tree.lua" },

    -- Fuzzy Finder (Telescope)
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- Treesitter for better syntax highlighting
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- LSP & Autocompletion
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },

    { "tpope/vim-fugitive" },

    { "mfussenegger/nvim-dap" },
{
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
      vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true }) -- Find files
      vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true }) -- Search text in files
      vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true }) -- List open buffers
    end
  }
})

vim.cmd("colorscheme gruvbox")
require("lualine").setup()
require("nvim-tree").setup()
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
local lspconfig = require("lspconfig")
local cmp = require("cmp")

-- Enable completion
cmp.setup({
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = { { name = "nvim_lsp" } },
})

-- Enable LSP
lspconfig.ts_ls.setup({}) -- JavaScript/TypeScript
lspconfig.gopls.setup({}) -- Go
lspconfig.lua_ls.setup({}) -- Lua

