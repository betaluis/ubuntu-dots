-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "sumneko_lua",
    "rust_analyzer",
})

lsp.setup()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["C-p"] = cmp.mapping.select_prev_item(cmp_select),
    ["C-n"] = cmp.mapping.select_next_item(cmp_select),
    ["C-y"] = cmp.mapping.confirm({ select = true }),
    ["C-Space"] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = { }
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bunfr)
    local opts = { buffer = bufnr, remap = false }
    local keymap = vim.keymap.set

    keymap("n", "gD", function() vim.lsp.buf.definition() end, opts)
    keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
    keymap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    keymap("n", "<leader>vd", function() vim.diognostic.open_float() end, opts)
    keymap("n", "[d", function() vim.diognostic.goto_next() end, opts)
    keymap("n", "]d", function() vim.diognostic.goto_prev() end, opts)
    keymap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    keymap("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    keymap("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


