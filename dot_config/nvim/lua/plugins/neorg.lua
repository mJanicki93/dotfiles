return {
	{
		"nvim-neorg/neorg",
		-- Nie musimy podawać 'dependencies' ani 'build', bo astrocommunity już to zrobiło
		opts = function(_, opts)
			-- Tu dobieramy się do domyślnej konfiguracji z AstroCommunity i ją rozszerzamy
			opts.load = opts.load or {}

			-- Konfiguracja Twoich ścieżek (Workspaces)
			opts.load["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/repos/notes/", -- Ścieżka do Twojego repo z dokumentacją
					},
					default_workspace = "notes",
				},
			}

			-- Dodatkowo włączamy 'concealer', żeby ikony (zadania, nagłówki) wyglądały ładnie
			opts.load["core.concealer"] = {}

			return opts
		end,
	},
}
