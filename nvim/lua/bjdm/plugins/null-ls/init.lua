local M = { module = "null-ls" }

function M.setup(options)
	local nls = require("null-ls")

	nls.setup({
		debounce = 150,
		save_after_format = false,

		sources = {
			nls.builtins.code_actions.gitsigns,
			nls.builtins.code_actions.refactoring,
			nls.builtins.code_actions.shellcheck,

			nls.builtins.diagnostics.actionlint,
			nls.builtins.diagnostics.ansiblelint,
			nls.builtins.diagnostics.checkmake,
			nls.builtins.diagnostics.chktex,
			nls.builtins.diagnostics.cppcheck,
			nls.builtins.diagnostics.djlint,
			nls.builtins.diagnostics.eslint,
			nls.builtins.diagnostics.flake8,
			nls.builtins.diagnostics.hadolint,
			nls.builtins.diagnostics.jsonlint,
			nls.builtins.diagnostics.luacheck,
			nls.builtins.diagnostics.markdownlint,
			nls.builtins.diagnostics.mypy,
			nls.builtins.diagnostics.proselint,
			nls.builtins.diagnostics.pydocstyle,
			nls.builtins.diagnostics.qmllint,
			nls.builtins.diagnostics.rstcheck,
			nls.builtins.diagnostics.write_good,
			nls.builtins.diagnostics.zsh,

			nls.builtins.formatting.black,
			nls.builtins.formatting.prettier,
		},
		on_attach = options.on_attach,
		root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
	})
end

function M.has_formatter(ft)
	local sources = require("null-ls.sources")
	local available = source.get_available(ft, "NULL_LS_FORMATTING")
	return #available > 0
end

return M
