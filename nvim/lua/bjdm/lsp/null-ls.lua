local nls = require("null-ls")

local M = {}

local sources = {
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
	--nls.builtins.diagnostics.hadolint,
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
	nls.builtins.formatting.qmllint,
}

function M.setup(on_attach)
	nls.setup({
		sources = sources,
		on_attach = on_attach
	})
end

return M
