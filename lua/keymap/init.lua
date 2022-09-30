local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require("keymap.config")

function merge(t1, t2)
	for k, v in pairs(t2) do
		if (type(v) == "table") and (type(t1[k] or false) == "table") then
			merge(t1[k], t2[k])
		else
			t1[k] = v
		end
	end
	return t1
end

local leader_map = {
	-- Bufferline
	["n|<leader>b"] = map_cr("BufferLine"):with_noremap():with_silent(),
	["n|<leader>bp"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
	["n|<leader>bj"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
	["n|<leader>bk"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
	["n|<leader>bh"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent(),
	["n|<leader>bl"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent(),
	["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap(),
	["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap(),
	-- Bufferline Number
	["n|<leader>bn"] = map_cr("BufferLineGoToBuffer Number"):with_noremap():with_silent(),
	["n|<leader>bn1"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
	["n|<leader>bn2"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
	["n|<leader>bn3"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
	["n|<leader>bn4"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
	["n|<leader>bn5"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
	["n|<leader>bn6"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
	["n|<leader>bn7"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
	["n|<leader>bn8"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
	["n|<leader>bn9"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
	-- Bufferline end

	-- Packer
	["n|<leader>p"] = map_cr("Packer"):with_silent():with_noremap():with_nowait(),
	["n|<leader>ps"] = map_cr("PackerSync"):with_silent():with_noremap():with_nowait(),
	["n|<leader>pu"] = map_cr("PackerUpdate"):with_silent():with_noremap():with_nowait(),
	["n|<leader>pi"] = map_cr("PackerInstall"):with_silent():with_noremap():with_nowait(),
	["n|<leader>pc"] = map_cr("PackerClean"):with_silent():with_noremap():with_nowait(),
	["n|<leader>pm"] = map_cr("PackerCompile"):with_silent():with_noremap():with_nowait(),
	-- Packer end

	-- Lsp
	["n|<leader>l"] = map_cr("Lsp"):with_noremap():with_silent():with_nowait(),
	["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
	["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),
	["n|<leader>la"] = map_cr("Lspsaga code_action"):with_noremap():with_silent(),
	["v|<leader>la"] = map_cu("Lspsaga code_action"):with_noremap():with_silent(),
	-- Lsp end

	-- Git
	["n|<leader>G"] = map_cu("Git"):with_noremap():with_silent(),
	-- Git end

	-- Trouble
	["n|<leader>r"] = map_cr("TroubleToggle"):with_noremap():with_silent(),
	["n|<leader>rr"] = map_cr("TroubleToggle lsp_references"):with_noremap():with_silent(),
	["n|<leader>rd"] = map_cr("TroubleToggle document_diagnostics"):with_noremap():with_silent(),
	["n|<leader>rw"] = map_cr("TroubleToggle workspace_diagnostics"):with_noremap():with_silent(),
	["n|<leader>rq"] = map_cr("TroubleToggle quickfix"):with_noremap():with_silent(),
	["n|<leader>rl"] = map_cr("TroubleToggle loclist"):with_noremap():with_silent(),
	-- Trouble end

	-- Nvim Tree
	["n|<leader>t"] = map_cr("NvimTree"):with_noremap():with_silent(),
	["n|<leader>tf"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
	["n|<leader>tr"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent(),
	["n|<leader>tt"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
	-- Nvim Tree end

	-- Telescope
	["n|<leader>f"] = map_cr("Telescope"):with_noremap():with_silent(),
	["n|<leader>fp"] = map_cu("lua require('telescope').extensions.project.project{}"):with_noremap():with_silent(),
	["n|<leader>fr"] = map_cu("lua require('telescope').extensions.frecency.frecency{}"):with_noremap():with_silent(),
	["n|<leader>fe"] = map_cu("Telescope oldfiles"):with_noremap():with_silent(),
	["n|<leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent(),
	["n|<leader>fn"] = map_cu(":enew"):with_noremap():with_silent(),
	["n|<leader>fw"] = map_cu("Telescope live_grep"):with_noremap():with_silent(),
	["n|<leader>fg"] = map_cu("Telescope git_files"):with_noremap():with_silent(),
	["n|<leader>fz"] = map_cu("Telescope zoxide list"):with_noremap():with_silent(),
	-- Telescope end

	-- Plugin Hop
	["n|<leader>h"] = map_cu("Hop"):with_noremap(),
	["n|<leader>hw"] = map_cu("HopWord"):with_noremap(),
	["n|<leader>hj"] = map_cu("HopLine"):with_noremap(),
	["n|<leader>hk"] = map_cu("HopLine"):with_noremap(),
	["n|<leader>h1"] = map_cu("HopChar1"):with_noremap(),
	["n|<leader>h2"] = map_cu("HopChar2"):with_noremap(),
	-- Plugin Hop end

	-- Plugin auto_session end

	-- DAP
	["n|<leader>d"] = map_cr("DAP"):with_noremap():with_silent(),
	["n|<leader>dr"] = map_cr("lua require('dap').continue()"):with_noremap():with_silent(),
	["n|<leader>dd"] = map_cr("lua require('dap').terminate() require('dapui').close()"):with_noremap():with_silent(),
	["n|<leader>db"] = map_cr("lua require('dap').toggle_breakpoint()"):with_noremap():with_silent(),
	["n|<leader>dB"] = map_cr("lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))")
		:with_noremap()
		:with_silent(),
	["n|<leader>dbl"] = map_cr("lua require('dap').list_breakpoints()"):with_noremap():with_silent(),
	["n|<leader>drc"] = map_cr("lua require('dap').run_to_cursor()"):with_noremap():with_silent(),
	["n|<leader>drl"] = map_cr("lua require('dap').run_last()"):with_noremap():with_silent(),
	["n|<leader>dv"] = map_cr("lua require('dap').step_over()"):with_noremap():with_silent(),
	["n|<leader>di"] = map_cr("lua require('dap').step_into()"):with_noremap():with_silent(),
	["n|<leader>do"] = map_cr("lua require('dap').step_out()"):with_noremap():with_silent(),
	["n|<leader>dl"] = map_cr("lua require('dap').repl.open()"):with_noremap():with_silent(),
	-- DAP end

	-- Util
	["v|<leader>u"] = map_cr("Util"):with_noremap():with_silent(),
	-- Util Plugin SnipRun
	["v|<leader>ur"] = map_cr("SnipRun"):with_noremap():with_silent(),
	-- Util Git
	["n|<leader>ug"] = map_cr("lua toggle_lazygit()"):with_noremap():with_silent(),
	["t|<leader>ug"] = map_cmd("<Esc><Cmd>lua toggle_lazygit()<CR>"):with_noremap():with_silent(),
	-- Util Plugin Diffview
	["n|<leader>ud"] = map_cr("DiffviewOpen"):with_silent():with_noremap(),
	["n|<leader>uD"] = map_cr("DiffviewClose"):with_silent():with_noremap(),
	-- Plugin auto_session
	["n|<leader>us"] = map_cu("Session"):with_noremap():with_silent(),
	["n|<leader>uss"] = map_cu("SaveSession"):with_noremap():with_silent(),
	["n|<leader>usr"] = map_cu("RestoreSession"):with_noremap():with_silent(),
	["n|<leader>usd"] = map_cu("DeleteSession"):with_noremap():with_silent(),
	-- Util end

	-- Setting
	["n|<leader>s"] = map_cr("Setting"):with_noremap():with_silent(),
	["n|<leader>sc"] = map_cu("Telescope colorscheme"):with_noremap():with_silent(),
	-- Setting end
}

local plug_map = {
	-- Bufferline
	["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
	["n|<C-l>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
	["n|<C-h>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
	["n|<C-S-k>"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent(),
	["n|<C-S-j>"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent(),

	-- Lsp mapp work when insertenter and lsp start
	["n|<A-t>"] = map_cr("LSoutlineToggle"):with_noremap():with_silent(),
	["n|g["] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
	["n|g]"] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
	["n|gs"] = map_cr("Lspsaga signature_help"):with_noremap():with_silent(),
	["n|gr"] = map_cr("Lspsaga rename"):with_noremap():with_silent(),
	["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
	["n|gd"] = map_cr("Lspsaga peek_definition"):with_noremap():with_silent(),
	["n|gD"] = map_cr("lua vim.lsp.buf.definition()"):with_noremap():with_silent(),
	["n|gh"] = map_cr("Lspsaga lsp_finder"):with_noremap():with_silent(),
	["n|gps"] = map_cr("G push"):with_noremap():with_silent(),
	["n|gpl"] = map_cr("G pull"):with_noremap():with_silent(),
	-- toggleterm

	-- ["t|<Esc><Esc>"] = map_cmd([[<C-\><C-n>]]), -- switch to normal mode in terminal.
	["n|<C-\\>"] = map_cr([[execute v:count . "ToggleTerm direction=horizontal"]]):with_noremap():with_silent(),
	["i|<C-\\>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=horizontal<CR>"):with_noremap():with_silent(),
	["t|<C-\\>"] = map_cmd("<Esc><Cmd>ToggleTerm<CR>"):with_noremap():with_silent(),
	["n|<C-w>t"] = map_cr([[execute v:count . "ToggleTerm direction=vertical"]]):with_noremap():with_silent(),
	["i|<C-w>t"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>"):with_noremap():with_silent(),
	["t|<C-w>t"] = map_cmd("<Esc><Cmd>ToggleTerm<CR>"):with_noremap():with_silent(),
	["n|<F5>"] = map_cr([[execute v:count . "ToggleTerm direction=vertical"]]):with_noremap():with_silent(),
	["i|<F5>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>"):with_noremap():with_silent(),
	["t|<F5>"] = map_cmd("<Esc><Cmd>ToggleTerm<CR>"):with_noremap():with_silent(),
	["n|<A-d>"] = map_cr([[execute v:count . "ToggleTerm direction=float"]]):with_noremap():with_silent(),
	["i|<A-d>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>"):with_noremap():with_silent(),
	["t|<A-d>"] = map_cmd("<Esc><Cmd>ToggleTerm<CR>"):with_noremap():with_silent(),
	-- Plugin trouble
	["n|gt"] = map_cr("TroubleToggle"):with_noremap():with_silent(),
	["n|gR"] = map_cr("TroubleToggle lsp_references"):with_noremap():with_silent(),
	-- Plugin nvim-tree
	["n|<C-n>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
	-- Plugin Undotree
	["n|<Leader>u"] = map_cr("UndotreeToggle"):with_noremap():with_silent(),
	-- Plugin accelerate-jk
	["n|j"] = map_cmd("v:lua.enhance_jk_move('j')"):with_silent():with_expr(),
	["n|k"] = map_cmd("v:lua.enhance_jk_move('k')"):with_silent():with_expr(),
	-- Plugin vim-eft
	["n|f"] = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
	["n|F"] = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
	["n|t"] = map_cmd("v:lua.enhance_ft_move('t')"):with_expr(),
	["n|T"] = map_cmd("v:lua.enhance_ft_move('T')"):with_expr(),
	["n|;"] = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
	-- Plugin EasyAlign
	["n|ga"] = map_cmd("v:lua.enhance_align('nga')"):with_expr(),
	["x|ga"] = map_cmd("v:lua.enhance_align('xga')"):with_expr(),
	-- Plugin MarkdownPreview
	["n|<F12>"] = map_cr("MarkdownPreviewToggle"):with_noremap():with_silent(),
	-- Plugin dap
	["n|<F6>"] = map_cr("lua require('dap').continue()"):with_noremap():with_silent(),
	["n|<F9>"] = map_cr("lua require('dap').step_over()"):with_noremap():with_silent(),
	["n|<F10>"] = map_cr("lua require('dap').step_into()"):with_noremap():with_silent(),
	["n|<F11>"] = map_cr("lua require('dap').step_out()"):with_noremap():with_silent(),
	["o|m"] = map_cu([[lua require('tsht').nodes()]]):with_silent(),
	["c|Q"] = map_cu([[%SnipRun]]):with_silent(),
	-- Plugin Tabout
	["i|<A-l>"] = map_cmd([[<Plug>(TaboutMulti)]]):with_silent(),
	["i|<A-h>"] = map_cmd([[<Plug>(TaboutBackMulti)]]):with_silent(),
}

local all_map = merge(leader_map, plug_map)

bind.nvim_load_mapping(all_map)
