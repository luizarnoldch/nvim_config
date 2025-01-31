return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")
    local go_capabilities = require("cmp_nvim_lsp").default_capabilities()
    local html_capabilities = vim.lsp.protocol.make_client_capabilities()
    html_capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Configuration for Lua
    lspconfig.lua_ls.setup({
      cmd = { "/opt/lua-language-server/bin/lua-language-server" },
      filetypes = { "lua" },
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            --checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- Configuration for Go
    lspconfig.gopls.setup({
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      capabilities = go_capabilities,
      on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true }
        local buf_set_keymap = vim.api.nvim_buf_set_keymap
        buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
      end,
    })

    -- Configuration for HTML
    lspconfig.html.setup({
      capabilities = html_capabilities,
      cmd = { "vscode-html-language-server", "--stdio" },
      filetypes = {
        "html",
        "templ",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      root_dir = util.root_pattern("package.json", ".git"),
      single_file_support = true,
      settings = {},
      init_options = {
        provideFormatter = true,
        embeddedLanguages = { css = true, javascript = true },
        configurationSection = { "html", "css", "javascript" },
      },
    })

    -- Configuration for JavaScript and TypeScript
    lspconfig.ts_ls.setup({
      cmd = { "typescript-language-server", "--stdio" },
      init_options = { hostInfo = "neovim" },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
      single_file_support = true,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
      end,
    })

    -- Configuration for TailwindCSS
    lspconfig.tailwindcss.setup({
      cmd = { "tailwindcss-language-server", "--stdio" },
      filetypes = {
        "html",
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "templ",
      },
      settings = {
        tailwindCSS = {
          validate = true,
          lint = {
            cssConflict = "warning",
            invalidApply = "error",
            invalidScreen = "error",
            invalidVariant = "error",
            invalidConfigPath = "error",
          },
          classAttributes = {
            "class",
            "className",
            "class:list",
            "classList",
            "ngClass",
          },
          includeLanguages = {
            eelixir = "html-eex",
            eruby = "erb",
            templ = "html",
          },
        },
      },
      root_dir = function(fname)
        return util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.cjs",
          "tailwind.config.mjs",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.cjs",
          "postcss.config.mjs",
          "postcss.config.ts"
        )(fname) or vim.fs.dirname(vim.fs.find("package.json", { path = fname, upward = true })[1]) or vim.fs.dirname(
          vim.fs.find("node_modules", { path = fname, upward = true })[1]
        ) or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
      end,
    })

    -- Configuration for SQL
    lspconfig.sqlls.setup({
      cmd = { "sql-language-server", "up", "--method", "stdio" },
      filetypes = { "sql", "mysql" },
      root_dir = util.root_pattern(".sqllsrc.json"),
      settings = {},
    })

    -- Configuration for Docker Compose
    lspconfig.docker_compose_language_service.setup({
      cmd = { "docker-compose-langserver", "--stdio" },
      filetypes = { "yaml.docker-compose" },
      root_dir = util.root_pattern("docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml"),
      single_file_support = true,
    })
  end,
}
