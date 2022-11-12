local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	return
end


neorg.setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.gtd.base"] = {
            config = {
                workspace = "example_gtd",
            }
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/work",
                    -- tasks = "~/notes/work/tasks",
                    journal = "~/notes/journal",
                    example_gtd = "~/notes/example_workspaces/gtd/"
                }
            }
        },
        ["core.keybinds"] = {
            config = {
                default_keybinds = true,
                neorg_leader = " ",
                hook = function(keybinds)
                    keybinds.unmap("all", "n", "<c-s>")
                end,
            },
        },
    }
}
