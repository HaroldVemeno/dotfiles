--[[
    Cesious Awesome WM theme
    Created by Culinax
    Modified by Thanos Apostolou
--]]

local themes_path = require("gears.filesystem").get_themes_dir()
theme = {}

theme.bg_normal   = "#141A1B"
theme.tabbar_bg_normal = "#141A1B"
theme.bg_focus    = "#222B2E"
theme.tabbar_bg_focus = "#222B2E"
theme.bg_urgent   = "#000000"
theme.bg_minimize = "#101010"
theme.bg_systray  = theme.bg_normal

theme.fg_normal   = "#ffffff"
theme.tabbar_fg_normal   = "#ffffff"
theme.fg_focus    = "#ffffff"
theme.tabbar_fg_focus    = "#ffffff"
theme.fg_urgent   = "#ff0000"
theme.fg_minimize = "#ffffff"

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#16A085"
theme.border_marked = "#16A085"

theme.hotkeys_modifiers_fg = "#2EB398"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = themes_path .. "cesious/taglist/squarefw.png"
theme.taglist_squares_unsel = themes_path .. "cesious/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "cesious/icons/submenu.png"
theme.menu_height = 25
theme.menu_width  = 200

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal              = themes_path .. "cesious/titlebar/close_normal_arc.png"
theme.titlebar_close_button_focus               = themes_path .. "cesious/titlebar/close_focus_arc.png"

theme.titlebar_ontop_button_normal_inactive     = themes_path .. "cesious/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = themes_path .. "cesious/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = themes_path .. "cesious/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = themes_path .. "cesious/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = themes_path .. "cesious/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = themes_path .. "cesious/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = themes_path .. "cesious/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = themes_path .. "cesious/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = themes_path .. "cesious/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = themes_path .. "cesious/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = themes_path .. "cesious/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = themes_path .. "cesious/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "cesious/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "cesious/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = themes_path .. "cesious/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = themes_path .. "cesious/titlebar/maximized_focus_active.png"

theme.wallpaper = "/usr/share/backgrounds/wallpapers-juhraya/Manjaro Juhraya (clean) - Mr_Glitch(Projekt:Root).png"
--theme.wallpaper = themes_path .. "cesious/awesome-scrabble.png"
--theme.wallpaper = "~/Pictures/velerybus maxib??lus.png"

-- You can use your own layout icons like this:
theme.layout_fairh      = themes_path .. "cesious/layouts/fairh.png"
theme.layout_fairv      = themes_path .. "cesious/layouts/fairv.png"
theme.layout_floating   = themes_path .. "cesious/layouts/floating.png"
theme.layout_magnifier  = themes_path .. "cesious/layouts/magnifier.png"
theme.layout_max        = themes_path .. "cesious/layouts/max.png"
theme.layout_fullscreen = themes_path .. "cesious/layouts/fullscreen.png"
theme.layout_tilebottom = themes_path .. "cesious/layouts/tilebottom.png"
theme.layout_tileleft   = themes_path .. "cesious/layouts/tileleft.png"
theme.layout_tile       = themes_path .. "cesious/layouts/tile.png"
theme.layout_tiletop    = themes_path .. "cesious/layouts/tiletop.png"
theme.layout_spiral     = themes_path .. "cesious/layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "cesious/layouts/dwindle.png"
theme.layout_cornernw   = themes_path .. "cesious/layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "cesious/layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "cesious/layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "cesious/layouts/cornerse.png"

theme.lain_icons         = os.getenv("HOME") ..
                           "/.config/awesome/lain/icons/layout/default/"
theme.layout_termfair    = theme.lain_icons .. "termfair.png"
theme.layout_centerfair  = theme.lain_icons .. "centerfair.png"  -- termfair.center
theme.layout_cascade     = theme.lain_icons .. "cascade.png"
theme.layout_cascadetile = theme.lain_icons .. "cascadetile.png" -- cascade.tile
theme.layout_centerwork  = theme.lain_icons .. "centerwork.png"
theme.layout_centerworkh = theme.lain_icons .. "centerworkh.png" -- centerwork.horizontal

-- theme.awesome_icon = themes_path .. "cesious/icons/manjaro64.png"
-- theme.awesome_icon = "/usr/share/pixmaps/archlinux-logo.png"
theme.awesome_icon = "/usr/share/archlinux/icons/archlinux-icon-crystal-256.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Adwaita"

theme.dont_swallow_classname_list = {"Event Tester", "Navigator", "firefox"}
theme.dont_swallow_filter_activated = true

-- theme.mstab_bar_ontop = true
theme.tabbar_style = "boxes"

return theme

