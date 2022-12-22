local M = {}

function M.ViMode()
	return {
		-- get vim current mode, this information will be required by the provider
		-- and the highlight functions, so we compute it only once per component
		-- evaluation and store it as a component attribute
		init = function(self)
			self.mode = vim.fn.mode(1) -- :h mode()

			-- execute this only once, this is required if you want the ViMode
			-- component to be updated on operator pending mode
			if not self.once then
				vim.api.nvim_create_autocmd("ModeChanged", {
					pattern = "*:*o",
					command = 'redrawstatus'
				})
				self.once = true
			end
		end,
		-- Now we define some dictionaries to map the output of mode() to the
		-- corresponding string and color. We can put these into `static` to compute
		-- them at initialisation time.
		static = {
			mode_names = { -- change the strings if you like it vvvvverbose!
			n = "N",
			no = "N?",
			nov = "N?",
			noV = "N?",
			["no\22"] = "N?",
			niI = "Ni",
			niR = "Nr",
			niV = "Nv",
			nt = "Nt",
			v = "V",
			vs = "Vs",
			V = "V_",
			Vs = "Vs",
			["\22"] = "^V",
			["\22s"] = "^V",
			s = "S",
			S = "S_",
			["\19"] = "^S",
			i = "I",
			ic = "Ic",
			ix = "Ix",
			R = "R",
			Rc = "Rc",
			Rx = "Rx",
			Rv = "Rv",
			Rvc = "Rv",
			Rvx = "Rv",
			c = "C",
			cv = "Ex",
			r = "...",
			rm = "M",
			["r?"] = "?",
			["!"] = "!",
			t = "T",
		},
		mode_colors = {
			n = "red" ,
			i = "green",
			v = "cyan",
			V =  "cyan",
			["\22"] =  "cyan",
			c =  "orange",
			s =  "purple",
			S =  "purple",
			["\19"] =  "purple",
			R =  "orange",
			r =  "orange",
			["!"] =  "red",
			t =  "red",
		}
	},
	-- We can now access the value of mode() that, by now, would have been
	-- computed by `init()` and use it to index our strings dictionary.
	-- note how `static` fields become just regular attributes once the
	-- component is instantiated.
	-- To be extra meticulous, we can also add some vim statusline syntax to
	-- control the padding and make sure our string is always at least 2
	-- characters long. Plus a nice Icon.
	provider = function(self)
		return " %2("..self.mode_names[self.mode].."%)"
	end,
	-- Same goes for the highlight. Now the foreground will change according to the current mode.
	hl = function(self)
		local mode = self.mode:sub(1, 1) -- get only the first mode character
		return { fg = self.mode_colors[mode], bold = true, }
	end,
	-- Re-evaluate the component only on ModeChanged event!
	-- This is not required in any way, but it's there, and it's a small
	-- performance improvement.
	update = {
		"ModeChanged",
	},
}
end

function M.FileNameBlock() 
	return {
		-- let's first set up some attributes needed by this component and it's children
		init = function(self)
			self.filename = vim.api.nvim_buf_get_name(0)
		end,
		-- We can now define some children separately and add them later
	}
end

function M.FileIcon()
	return {
		init = function(self)
			local filename = self.filename
			local extension = vim.fn.fnamemodify(filename, ":e")
			self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
		end,
		provider = function(self)
			return self.icon and (self.icon .. " ")
		end,
		hl = function(self)
			return { fg = self.icon_color }
		end
	}
end

function M.FileName()
	return {
		provider = function(self)
			-- first, trim the pattern relative to the current directory. For other
			-- options, see :h filename-modifers
			local filename = vim.fn.fnamemodify(self.filename, ":.")
			if filename == "" then return "[No Name]" end
			-- now, if the filename would occupy more than 1/4th of the available
			-- space, we trim the file path to its initials
			-- See Flexible Components section below for dynamic truncation
			if not conditions.width_percent_below(#filename, 0.25) then
				filename = vim.fn.pathshorten(filename)
			end
			return filename
		end,
		hl = { fg = utils.get_highlight("Directory").fg },
	}
end

function M.FileFlags()
	return {
		{
			condition = function()
				return vim.bo.modified
			end,
			provider = "[+]",
			hl = { fg = "green" },
		},
		{
			condition = function()
				return not vim.bo.modifiable or vim.bo.readonly
			end,
			provider = "",
			hl = { fg = "orange" },
		},
	}
end

-- Now, let's say that we want the filename color to change if the buffer is
-- modified. Of course, we could do that directly using the FileName.hl field,
-- but we'll see how easy it is to alter existing components using a "modifier"
-- component

function M.FileNameModifer()
	return {
		hl = function()
			if vim.bo.modified then
				-- use `force` because we need to override the child's hl foreground
				return { fg = "cyan", bold = true, force=true }
			end
		end,
	}
end

-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(FileNameBlock,
FileIcon,
utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
unpack(FileFlags), -- A small optimisation, since their parent does nothing
{ provider = '%<'} -- this means that the statusline is cut here when there's not enough space
)

function M.FileType() 
	return {
		provider = function()
			return string.upper(vim.bo.filetype)
		end,
		hl = { fg = utils.get_highlight("Type").fg, bold = true },
	}
end

function M.FileEncoding() 
	return {
		provider = function()
			local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
			return enc ~= 'utf-8' and enc:upper()
		end
	}
end

function M.FileFormat() 
	return {
		provider = function()
			local fmt = vim.bo.fileformat
			return fmt ~= 'unix' and fmt:upper()
		end
	}
end
-- We're getting minimalists here!

function M.Ruler 
return {
	-- %l = current line number
	-- %L = number of lines in the buffer
	-- %c = column number
	-- %P = percentage through file of displayed window
	provider = "%7(%l/%3L%):%2c %P",
}
	end
	-- I take no credits for this! :lion:
	function M.ScrollBar() 
		return {
			static = {
				sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
				-- Another variant, because the more choice the better.
				-- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
			},
			provider = function(self)
				local curr_line = vim.api.nvim_win_get_cursor(0)[1]
				local lines = vim.api.nvim_buf_line_count(0)
				local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
				return string.rep(self.sbar[i], 2)
			end,
			hl = { fg = "blue", bg = "bright_bg" },
		}
	end

	function M.LSPActive
	return {
		condition = conditions.lsp_attached,
		update = {'LspAttach', 'LspDetach'},

		-- You can keep it simple,
		-- provider = " [LSP]",

		-- Or complicate things a bit and get the servers names
		provider  = function()
			local names = {}
			for i, server in pairs(vim.lsp.buf_get_clients(0)) do
				table.insert(names, server.name)
			end
			return " [" .. table.concat(names, " ") .. "]"
		end,
		hl = { fg = "green", bold = true },
	}
end

function M.LSPMessages() 
	return {
		provider = require("lsp-status").status,
		hl = { fg = "gray" },
	}
end

function M.Diagnostics() 
	return {

		condition = conditions.has_diagnostics,

		static = {
			error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
			warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
			info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
			hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
		},

		init = function(self)
			self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
			self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
			self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
			self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
		end,

		update = { "DiagnosticChanged", "BufEnter" },

		{
			provider = "![",
		},
		{
			provider = function(self)
				-- 0 is just another output, we can decide to print it or not!
				return self.errors > 0 and (self.error_icon .. self.errors .. " ")
			end,
			hl = { fg = "diag_error" },
		},
		{
			provider = function(self)
				return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
			end,
			hl = { fg = "diag_warn" },
		},
		{
			provider = function(self)
				return self.info > 0 and (self.info_icon .. self.info .. " ")
			end,
			hl = { fg = "diag_info" },
		},
		{
			provider = function(self)
				return self.hints > 0 and (self.hint_icon .. self.hints)
			end,
			hl = { fg = "diag_hint" },
		},
		{
			provider = "]",
		},
	}
end

function M.Git() 
	return {
		condition = conditions.is_git_repo,

		init = function(self)
			self.status_dict = vim.b.gitsigns_status_dict
			self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
		end,

		hl = { fg = "orange" },


		{   -- git branch name
		provider = function(self)
			return " " .. self.status_dict.head
		end,
		hl = { bold = true }
	},
	-- You could handle delimiters, icons and counts similar to Diagnostics
	{
		condition = function(self)
			return self.has_changes
		end,
		provider = "("
	},
	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and ("+" .. count)
		end,
		hl = { fg = "git_add" },
	},
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and ("-" .. count)
		end,
		hl = { fg = "git_del" },
	},
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and ("~" .. count)
		end,
		hl = { fg = "git_change" },
	},
	{
		condition = function(self)
			return self.has_changes
		end,
		provider = ")",
	},
}
	end

	function M.DAPMessages = {
		-- display the dap messages only on the debugged file
		condition = function()
			local session = require("dap").session()
			if session then
				local filename = vim.api.nvim_buf_get_name(0)
				if session.config then
					local progname = session.config.program
					return filename == progname
				end
			end
			return false
		end,
		provider = function()
			return " " .. require("dap").status()
		end,
		hl = { fg = utils.get_highlight('Debug').fg },
	}
end

return M
