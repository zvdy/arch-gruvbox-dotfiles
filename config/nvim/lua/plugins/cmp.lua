return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- Enter: Accept the suggestion if visible, otherwise create a newline
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = false })  -- Accept the current suggestion
          else
            fallback()  -- Create a newline
          end
        end, { "i", "s" }),
  
        -- Shift+Enter: Skip accepting suggestions and create a newline
        ["<S-CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.close()  -- Close the suggestion menu without accepting
          end
          fallback()  -- Create a newline
        end, { "i", "s" }),
      })
      return opts
    end,
  }
  