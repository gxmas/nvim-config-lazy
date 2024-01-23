return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = cmp.mapping.preset.insert(vim.tbl_deep_extend("force", opts.mapping, {
      ["C-y"] = cmp.mapping.confirm({ select = true }),
      -- I'd rather remove the mapping <CR>, but I don't know how to do it.
      ["<CR>"] = function(fallback)
        cmp.abort()
        fallback()
      end,
    }))
  end,
}
