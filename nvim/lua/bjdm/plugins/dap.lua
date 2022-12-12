local dap = require("dap")
local ui = require("dapui")

-- Define adapters
-- See :h dap-adapters for more.

dap.adapters.python = {
	type = 'executable';
	command = os.getenv('XDG_DATA_HOME') .. '/debugpy/debugpy/bin/python';
	args = { '-m', 'debugpy.adapter' };
}

--dap_python.test_runner = 'pytest'

-- dap_python.DebugpyConfig = {
-- 	'justMyCode': False,
-- 	'redirectOutput': True,
--
-- }
dap.configurations.python = {
	-- Debugpy configuration
	-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

	{
		-- First three options are required by nvim-dap. Rest are debugpy specific.
		-- See :h dap-configuration for more
		type = 'python';
		request = 'launch';
		name = "Launch script (system python)";
		program = "${file}";
		pythonPath = function()
			return '/usr/bin/python'
		end;
	},
	{
		name = "Python: Flask";
		type = "python";
		request = "launch";

		-- debugpy configuration
		module = "flask";
		-- TODO can I handle this with dotenv
		env = {
			FLASK_APP = "api.py";
			FLASK_ENV = "development";
			FLASK_DEBUG = "1";
		},
		args = { 'run', '--no-debugger', '--no-reload' };
		--local venv = os.getenv("VIRTUAL_ENV")
		--command = vim.fn.getcwd() .. string.format("%s/bin/python",venv)
		--python = os.getenv('VIRTUAL_ENV') .. '/bin/python'
	},
	{
		name = "Python: pytest";
		type = "python";
		request = "launch";

		-- debugpy configuration
		module = "pytest";
		env = {
			FLASK_APP = "api.py";
			FLASK_ENV = "development";
			FLASK_DEBUG = "1";
		},
		args = { '-s' };
		--local venv = os.getenv("VIRTUAL_ENV")
		--command = vim.fn.getcwd() .. string.format("%s/bin/python",venv)
		--python = os.getenv('VIRTUAL_ENV') and '/usr/bin/python' or os.getenv('VIRTUAL_ENV') .. '/bin/python';
		path = (
			function()
				if os.getenv('VIRTUAL_ENV') then
					print(os.getenv('VIRTUAL_ENV') .. '/bin/python')
					return os.getenv('VIRTUAL_ENV') .. '/bin/python'
				else
					print('/usr/bin/python')
					return '/usr/bin/python'
				end
			end
		);
	}
}


ui.setup()
