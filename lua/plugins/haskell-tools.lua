return {
  "mrcjkb/haskell-tools.nvim",
  version = "^3",
  ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  init = function()
    vim.g.haskell_tools = {
      ---@type HaskellLspClientOpts
      hls = {
        on_attach = function(_, bufnr, ht)
          vim.keymap.set("n", "<leader>ch", ht.hoogle.hoogle_signature, { buffer = bufnr, desc = "Hoogle Signature" })
          vim.keymap.set("n", "<leader>rt", ht.repl.toggle, { buffer = bufnr, desc = "Toggle a project GHCi repl" })
          vim.keymap.set("n", "<leader>rf", function()
            ht.repl.toggle(vim.api.nvim_buf_get_name(0))
          end, { buffer = bufnr, desc = "Toogle a file GHCi repl" })
          vim.keymap.set("n", "<leader>rr", ht.repl.reload, { buffer = bufnr, desc = "Reload the GHCi repl" })
          vim.keymap.set("n", "<leader>rq", ht.repl.quit, { buffer = bufnr, desc = "Quit the GHCi repl" })
        end,
      },
    }
  end,
}
