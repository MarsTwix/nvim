return
{
	require('lazy').setup({
	  'nvim-treesitter/nvim-treesitter',
	  lazy = false,
	  branch = 'main',
	  build = ':TSUpdate'
	})
}
