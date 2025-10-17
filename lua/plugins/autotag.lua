return {
	"windwp/nvim-ts-autotag",
	dependencies = "nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	ft = { "html", "xml", "jsx", "tsx", "vue", "svelte", "php" },
}
