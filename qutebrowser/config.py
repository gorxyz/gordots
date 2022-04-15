config.load_autoconfig(False)
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'no-3rdparty', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
c.downloads.location.directory = "~/"
c.url.default_page = 'https://searx.tiekoetter.com'
c.url.start_pages = 'https://searx.tiekoetter.com'
c.url.searchengines = {'DEFAULT': 'https://searx.tiekoetter.com/?q={}', 'gs': 'https://www.google.com/search?q={}', 'ys': 'https://www.youtube.com/results?search_query={}'}
c.statusbar.show = 'in-mode'
c.tabs.show = 'multiple'
c.scrolling.smooth = True
c.downloads.remove_finished = 1
c.content.blocking.method = 'adblock'
c.content.autoplay = False
c.content.javascript.enabled = False
config.bind('xs', 'config-cycle --temp --print --pattern *://*.{url:host}/* content.javascript.enabled ;; reload')
config.set('content.javascript.enabled', True, 'https://www.youtube.com')
config.set('content.javascript.enabled', True, 'https://www.github.com')
config.set('content.javascript.enabled', True, 'https://www.lichess.org')
