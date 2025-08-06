return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Add pyright to the list of servers
        pyright = {
          -- Optional: Add custom settings
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
      },
    },
  },
}
