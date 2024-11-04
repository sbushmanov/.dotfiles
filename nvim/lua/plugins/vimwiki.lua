return {
  keys = "<leader>ww",
  "vimwiki/vimwiki",
  branch = "dev",
  init = function()
    vim.g.vimwiki_list = {
      {
        template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/",
        syntax = "default",
        ext = ".md",
        path = "~/Documents/vimwiki",
        diary_rel_path = 'diary'
      },
    }
    vim.g.vimwiki_global_ext = 0
  end,
}
