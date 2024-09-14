function _G.show_docs()
	local cw = vim.fn.expand("<cword>")
	if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
		vim.api.nvim_command('h ' .. cw)
	elseif vim.api.nvim_eval('coc#rpc#ready()') then
		vim.fn.CocActionAsync('doHover')
	else
		vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
	end
end

return {

	{

		"neoclide/coc.nvim",
		enabled = false,
		config = function()
			local keyset = vim.keymap.set
			local opts = { noremap = true, silent = true, expr = true, replace_keycodes = false }
			keyset('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"]], opts)

			-- open suggest
			keyset('i', '<c-/>', 'coc#refresh()', opts)

			-- show docs
			keyset('n', 'K', '<cmd>lua _G.show_docs()<cr>', { silent = true })


			-- fileformat
			keyset('x', '=', '<Plug>(coc-format-selected)', { silent = true })
			-- rename symbol
			keyset('n', 'gr', '<Plug>(coc-references)', { silent = true })
			-- toggle comment
			keyset('n', '<space>c', '<Plug>(coc-toggle-comment)', { silent = true })
			-- goto definition
			keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
			-- next error
			keyset('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true })
		end
	}
}
