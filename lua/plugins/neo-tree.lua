return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    window = {
      mappings = {
        ["a"] = {
          "add",
          config = {
            show_path = "relative", -- 显示相对路径
            prompt = "Enter name for new file/folder: ",
            callback = function(state)
              local node = state.tree:get_node()
              local path = node:get_id()

              -- 如果当前节点是文件，则使用其父目录
              if node.type == "file" then
                path = vim.fn.fnamemodify(path, ":h")
              end

              -- 自动填充路径并等待用户输入
              local name = vim.fn.input("Enter name for new file/folder: ", path .. "/")
              if name ~= "" then
                if name:sub(-1) == "/" then
                  -- 创建文件夹
                  vim.fn.mkdir(name, "p")
                else
                  -- 创建文件
                  local file = io.open(name, "w")
                  if file then
                    file:close()
                  end
                end
                require("neo-tree.sources.filesystem").refresh()
              end
            end,
          },
        },
      },
    },
  },
}
