return {
    {
        "echasnovski/mini.nvim",
        branch = "main",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            function ToggleMiniFiles()
                if not MiniFiles.close() then
                    MiniFiles.open()
                end
            end

            require("mini.files").setup({})
            vim.api.nvim_set_keymap("n", "<leader>mm", ':lua ToggleMiniFiles()<CR>',
                { noremap = true, silent = true })
        end
    },
}
