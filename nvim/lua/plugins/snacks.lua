return {
  {
    "folke/snacks.nvim",
    init = function()
      local function explorer_sidebar_active()
        if not (_G.Snacks and Snacks.picker and Snacks.picker.get) then
          return false
        end

        local current_win = vim.api.nvim_get_current_win()
        for _, picker in ipairs(Snacks.picker.get({ source = "explorer", tab = false })) do
          if picker and not picker.closed then
            local wins = {
              picker.list and picker.list.win and picker.list.win.win,
              picker.input and picker.input.win and picker.input.win.win,
            }
            if vim.tbl_contains(wins, current_win) then
              return true
            end
          end
        end

        return false
      end

      local function tmux_left()
        if vim.fn.mode():find("^i") then
          vim.cmd("stopinsert")
        end

        if vim.env.TMUX then
          vim.fn.system({ "tmux", "select-pane", "-L" })
        else
          vim.cmd("wincmd h")
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "snacks_picker_list", "snacks_picker_input" },
        callback = function(event)
          vim.keymap.set({ "n", "i" }, "<M-h>", function()
            if explorer_sidebar_active() then
              tmux_left()
            else
              vim.cmd("TmuxNavigateLeft")
            end
          end, { buffer = event.buf, desc = "Go to left split/tmux pane" })
        end,
      })
    end,
    opts = function(_, opts)
      -- Keep Alt-h reserved for pane navigation. Explorer already supports `H`
      -- for toggling hidden files, so removing this duplicate binding is safe.
      opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
        win = {
          input = { keys = { ["<a-h>"] = false } },
          list = { keys = { ["<a-h>"] = false } },
        },
      })
    end,
  },
}
