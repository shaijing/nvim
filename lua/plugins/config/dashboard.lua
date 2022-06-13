local home = os.getenv('HOME')
local db = require('dashboard')
--db.preview_command = 'cat | lolcat -F 0.3'
db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 12
db.preview_file_width = 80
db.custom_center = {
    {
        icon = "  ",
        desc = "Projects                            ",
        action = "Telescope projects",

    },
    {
        icon = "  ",
        desc = "Recently files                      ",
        action = "Telescope oldfiles",
    },
    {
        icon = "  ",
        desc = "Edit keybindings                    ",
        action = "edit ~/.config/nvim/lua/basic/keybindings.lua",
    },
    {
        icon = "  ",
        desc = "Edit Projects                       ",
        action = "edit ~/.local/share/nvim/project_nvim/project_history",
    },
    { icon = '  ',
        desc = 'File Browser                        ',
        action = 'Telescope file_browser',
    },
}
db.custom_header = {
    [[]],
    [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
    [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
    [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
    [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
    [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    [[                                                   ]],
}
