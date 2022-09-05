local home = os.getenv("HOME")
local dap = require("dap")
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.loop.cwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process
		-- is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
		skipFiles = {
			"<node_internals>/**",
			"node_modules/**",
		},
	},
	{

		name = "Debug Mocha Tests",
		type = "node2",
		request = "launch",
		cwd = vim.loop.cwd(),
		runtimeArgs = {
			"--inspect-brk",
			"${workspaceFolder}/node_modules/mocha/bin/_mocha",
		},
		sourceMaps = true,
		protocol = "inspector",
		runtimeExecutable = "node",
		args = { "inspect", "${file}" },
		port = 9229,
		console = "integratedTerminal",
		skipFiles = {
			"<node_internals>/**",
			"<node_internals>/**/*.js",
			"**/<node_internals>/**",
			"node_modules/**",
		},
        smartStep = true
	},
}

dap.configurations.typescript = {
	{
		name = "ts-node (Node2 with ts-node)",
		type = "node2",
		request = "launch",
		cwd = vim.loop.cwd(),
		runtimeArgs = { "-r", "ts-node/register" },
		runtimeExecutable = "node",
		args = { "--inspect", "${file}" },
		sourceMaps = true,
		skipFiles = { "<node_internals>/**", "node_modules/**" },
	},
	{
		name = "Jest (Node2 with ts-node)",
		type = "node2",
		request = "launch",
		cwd = vim.loop.cwd(),
		runtimeArgs = { "--inspect-brk", "${workspaceFolder}/node_modules/jest/bin/jest.js" },
		runtimeExecutable = "node",
		args = { "${file}", "--runInBand", "--coverage", "false" },
		sourceMaps = true,
		port = 9229,
		skipFiles = {
			"<node_internals>/**",
			"<node_internals>/**/*.js",
			"**/<node_internals>/**",
			"node_modules/**",
		},
        smartStep = true
	},
}
