import dracula.draw

config.load_autoconfig(False)

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

c.session.lazy_restore = True
c.auto_save.session = True

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:136.0) Gecko/20100101 Firefox/139.0', 'https://accounts.google.com/*')

config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

config.set('content.javascript.clipboard', 'access-paste', 'https://draculatheme.com')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

c.content.javascript.modal_dialog = True

config.set('content.local_content_can_access_remote_urls', True, 'file:///home/sachin/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///home/sachin/.local/share/qutebrowser/userscripts/*')

c.content.plugins = True
c.content.blocking.enabled = True;
c.completion.shrink = False

c.statusbar.show = 'never'
c.statusbar.padding = {'bottom': 7, 'left': 7, 'right': 7, 'top': 7}

c.tabs.last_close = 'startpage'
c.tabs.padding = {'bottom': 7, 'left': 7, 'right': 7, 'top': 7}
c.tabs.select_on_remove = 'last-used'
c.tabs.show = 'switching'
c.tabs.width = '10%'
c.tabs.max_width = 200

c.fonts.default_family = 'ShureTechMono Nerd Font'

c.url.default_page = 'file:///home/sachin/.config/qutebrowser/homepage.html'

c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}', 
    'yt': 'https://www.youtube.com/results?search_query={}',
    "aw": "https://wiki.archlinux.org/?search={}",
}

c.url.start_pages = 'file:///home/sachin/.config/qutebrowser/homepage.html'

c.window.hide_decoration = True

c.colors.webpage.darkmode.enabled = False
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'smart'
c.colors.webpage.preferred_color_scheme = 'dark'

# Binding for Normal Mode
config.bind('t', 'cmd-set-text -s :open -t ')
config.bind('M', 'hint links spawn mpv --fs {hint-url}')
config.bind('zs', 'config-cycle statusbar.show always never')
config.bind('zb', 'config-cycle tabs.show always never')
config.bind('zz', 'config-cycle statusbar.show always never ;; config-cycle tabs.show always never')

