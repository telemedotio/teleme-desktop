


AVALABLE_LANGUAGE_CODE =
  en : 'en'
  es : 'es'
  hi : 'hi' # Hindi
  ar : 'ar' # Arabic
  pt : 'pt' # Portuguese
  bn : 'bn' # Bengali language
  pa : 'pa' # Punjabi
  de : 'de' # German
  fr : 'fr'
  ja : 'ja'
  ru : 'ru'
  ko : 'ko'
  #zh : 'zh-hans'
AVALABLE_LANGUAGE_CODE['zh-hans'] = 'zh-hans'
AVALABLE_LANGUAGE_CODE['zh-hant'] = 'zh-hant'
AVALABLE_LANGUAGE_CODE['zh-hk'] = 'zh-hant'
AVALABLE_LANGUAGE_CODE['zh-tw'] = 'zh-hant'


I18N_ENTRY =
  en :
    TITLE : 'Telegram Group Management Made Easy'
    SUB_TITLE : 'TeleMe delivers a robust solution for Telegram group management and analytics.'
    HELP_DESK : 'Help Desk'
    CONNECTING_TELEME : 'Connecting to TeleMe server...'
    CONNECTING_TELEGRAM : "Connecting to Telegram Web Service..."
    CONNECTING_TELEGRAM_FAILED : 'Fail to connect to TeleMe server.'
    CONNECTING_TELEGRAM_FAILED  : 'Fail to connect to Telegram Web Service.'
    CONNECTING_FAILED : 'Please check your network connection. \nError:'
    CONNECTING_RETRY : 'Retry connection?'
    LAUNCH : "Launch TeleMe."

  es :
    TITLE : ''
    SUB_TITLE : ''
    HELP_DESK : ''
    CONNECTING_TELEME : ''
    CONNECTING_TELEGRAM : ''
    CONNECTING_TELEGRAM_FAILED : ''
    CONNECTING_TELEGRAM_FAILED  : ''
    CONNECTING_FAILED : ''

  hi :
    TITLE : ''
    SUB_TITLE : ''
    HELP_DESK : ''
    CONNECTING_TELEME : ''
    CONNECTING_TELEGRAM : ''
    CONNECTING_TELEGRAM_FAILED : ''
    CONNECTING_TELEGRAM_FAILED  : ''
    CONNECTING_FAILED : ''

  ar :
    TITLE : ''
    SUB_TITLE : ''
    HELP_DESK : ''
    CONNECTING_TELEME : ''
    CONNECTING_TELEGRAM : ''
    CONNECTING_TELEGRAM_FAILED : ''
    CONNECTING_TELEGRAM_FAILED  : ''
    CONNECTING_FAILED : ''

  pt :
    TITLE : ''
    SUB_TITLE : ''
    HELP_DESK : ''
    CONNECTING_TELEME : ''
    CONNECTING_TELEGRAM : ''
    CONNECTING_TELEGRAM_FAILED : ''
    CONNECTING_TELEGRAM_FAILED  : ''
    CONNECTING_FAILED : ''

  bn :
    TITLE : ''
    SUB_TITLE : ''
    HELP_DESK : ''
    CONNECTING_TELEME : ''
    CONNECTING_TELEGRAM : ''
    CONNECTING_TELEGRAM_FAILED : ''
    CONNECTING_TELEGRAM_FAILED  : ''
    CONNECTING_FAILED : ''

  pa :
    TITLE : ''
    SUB_TITLE : ''
    HELP_DESK : ''
    CONNECTING_TELEME : ''
    CONNECTING_TELEGRAM : ''
    CONNECTING_TELEGRAM_FAILED : ''
    CONNECTING_TELEGRAM_FAILED  : ''
    CONNECTING_FAILED : ''

  de :
    TITLE : ''
    SUB_TITLE : ''
    HELP_DESK : ''
    CONNECTING_TELEME : ''
    CONNECTING_TELEGRAM : ''
    CONNECTING_TELEGRAM_FAILED : ''
    CONNECTING_TELEGRAM_FAILED  : ''
    CONNECTING_FAILED : ''

  fr :
    TITLE : ''
    SUB_TITLE : ''
    HELP_DESK : ''
    CONNECTING_TELEME : ''
    CONNECTING_TELEGRAM : ''
    CONNECTING_TELEGRAM_FAILED : ''
    CONNECTING_TELEGRAM_FAILED  : ''
    CONNECTING_FAILED : ''

  ja :
    TITLE : ''
    SUB_TITLE : ''
    HELP_DESK : ''
    CONNECTING_TELEME : ''
    CONNECTING_TELEGRAM : ''
    CONNECTING_TELEGRAM_FAILED : ''
    CONNECTING_TELEGRAM_FAILED  : ''
    CONNECTING_FAILED : ''

  ru :
    TITLE : ''
    SUB_TITLE : ''
    HELP_DESK : ''
    CONNECTING_TELEME : ''
    CONNECTING_TELEGRAM : ''
    CONNECTING_TELEGRAM_FAILED : ''
    CONNECTING_TELEGRAM_FAILED  : ''
    CONNECTING_FAILED : ''

  ko :
    TITLE : ''
    SUB_TITLE : ''
    HELP_DESK : ''
    CONNECTING_TELEME : ''
    CONNECTING_TELEGRAM : ''
    CONNECTING_TELEGRAM_FAILED : ''
    CONNECTING_TELEGRAM_FAILED  : ''
    CONNECTING_FAILED : ''

  "zh-hans" :
    TITLE : '运营Telegram电报社群从此轻而易举'
    SUB_TITLE : 'TeleMe为您提供功能强大又方便好用的Telegram社群管理工具。'
    HELP_DESK : '联系客服'
    CONNECTING_TELEME : '正在连接TeleMe服务器...'
    CONNECTING_TELEGRAM : '正在连接Telegram平台...'
    CONNECTING_TELEME_FAILED : '无法连接到TeleMe服务器！'
    CONNECTING_TELEGRAM_FAILED  : '无法连接到Telegram平台！'
    CONNECTING_FAILED : '请检查您的网络设置，然后再重试。 \n错误信息'
    CONNECTING_RETRY : '要重试连接吗？'
    LAUNCH : "启动TeleMe."

  "zh-hant" :
    TITLE : '運營Telegram電報社群從此輕而易舉'
    SUB_TITLE : 'TeleMe為您提供功能強大又方便好用的Telegram社群管理工具。 '
    HELP_DESK : '聯繫客服'
    CONNECTING_TELEME : '正在連接TeleMe服務器...'
    CONNECTING_TELEGRAM : '正在連接Telegram平台...'
    CONNECTING_TELEME_FAILED : '無法連接到TeleMe服務器！ '
    CONNECTING_TELEGRAM_FAILED : '無法連接到Telegram平台！ '
    CONNECTING_FAILED : '請檢查您的網絡設置，然後再重試。 \n錯誤信息'
    CONNECTING_RETRY : '要重試連接嗎？ '
    LAUNCH : '啟動TeleMe.'



STATE = 0

EL_TITLE = null
EL_SUB_TITLE = null
EL_LABELUP = null
EL_BTN_HELP = null

getAvaliableLanguage = (languageCode)->
  languageCode = String(languageCode || (navigator and navigator.language) || '').trim()
  return 'en' if languageCode.length < 2
  languageCode = languageCode.toLocaleLowerCase()

  first2Char = languageCode.substr(0, 2)
  found = AVALABLE_LANGUAGE_CODE[first2Char] || AVALABLE_LANGUAGE_CODE[languageCode.substr(0, 5)] || AVALABLE_LANGUAGE_CODE[languageCode.substr(0, 7)]

  found or= ((first2Char is 'zh') and "zh-hans") || 'en'
  return found

CurrentLanguageCode = getAvaliableLanguage()

getI18nEntry = (entnyId)->
  return '' unless entnyId
  set = I18N_ENTRY[CurrentLanguageCode] || I18N_ENTRY['en']
  return set[entryId] if set[entryId]
  return I18N_ENTRY['en'][entryId] || entryId


reinstateNodes = (callback)->
  EL_TITLE = $('#ELTitle')
  EL_SUB_TITLE = $('#ELSubtitle')
  EL_LABELUP =  $('#ELLabelUp')
  EL_BTN_HELP =  $('#ELHelpDesk')

  EL_TITLE.text(getI18nEntry('TITLE'))
  EL_SUB_TITLE.text(getI18nEntry('SUB_TITLE'))
  EL_BTN_HELP.text(getI18nEntry('HELP_DESK'))

  EL_TITLE.fadeIn 'slow', ->
    EL_SUB_TITLE.fadeIn 'slow', ->
      EL_LABELUP.fadeIn('slow')
      callback()
      return
    return
  return

URL_TO_TELEME_WEB = "https://www.teleme.io/web?utm_source=teleme_desktop&utm_medium=referral&hl=#{LANGUAGE_CODE}&r=#{Date.now()}"

URL_TO_TELEGRAM = "https://telegram.org/js/telegram-widget.js?r=#{Date.now()}"


fetchWithTimeout = (url)->
  Promise.race([
    fetch(url),
    new Promise((_, reject)->
      setTimeout((()-> reject(new Error('Timeout'))), 8888)
    )
  ])

doFetch = (url, callback)->
  fetchWithTimeout(URL_TO_TELEME_WEB)
    .then((res) ->
      unless res and res.status >= 200 and res.status < 400
        throw new Error "invalid http status #{res.status} from the server."
      return res)
    .then(-> callback())
    .catch (err) ->
      console.log "ERROR _httpGetJson url #{url}. error:", err
      callback err
      return
  return

openupTeleme = ->
  options =
    "title": "TeleMe Desktop",
    "width" : 1118,
    "height": 888,
    "min_width" : 518,
    "min_height" : 518,
    "resizable" : true
    "frame" : true

  nw.Window.open URL_TO_TELEME_WEB, options, (newWin)->
    newWin.on 'new-win-policy', (frame, url, policy)->

      return if url.indexOf("oauth.telegram") > 0

      # do not open the window
      policy.ignore()
      # and open it in external browser
      nw.Shell.openExternal(url)
      return

    window.close(true)
    return

  analytics and analytics.event('client_desktop', 'go_web', { eventLabel: 'label' });
  return

logLineUp = (msg)-> EL_LABELUP.text(String(msg || ''))

main = ->
  logLineUp(getI18nEntry("CONNECTING_TELEME"))

  doFetch URL_TO_TELEME_WEB, (err)->
    if err?
      logLineUp(getI18nEntry("CONNECTING_TELEME_FAILED"))
      notifyFailure "#{getI18nEntry("CONNECTING_TELEME_FAILED")}\n#{getI18nEntry("CONNECTING_FAILED")}:#{err}\n#{getI18nEntry('CONNECTING_RETRY')}"
      return

    logLineUp(getI18nEntry("CONNECTING_TELEGRAM"))
    doFetch URL_TO_TELEGRAM, (err)->
      if err?
        logLineUp(getI18nEntry("CONNECTING_TELEGRAM_FAILED"))
        notifyFailure "#{getI18nEntry("CONNECTING_TELEGRAM_FAILED")}\n#{getI18nEntry("CONNECTING_FAILED")}:#{err}\n#{getI18nEntry('CONNECTING_RETRY')}"
        return

      logLineUp(getI18nEntry("LAUNCH"))
      openupTeleme()
      return
    return
  return

notifyFailure = (msg)->
  analytics and analytics.event('client_desktop', 'conect_failed')
  if confirm(msg)
    setTimeout(main, 888)
    EL_BTN_HELP.fadeIn('slow')
    analytics and analytics.event('client_desktop', 'connect_retry')
  else
    nw.App.quit()
  return

$(document).ready ->
  reinstateNodes(main)

  nw and nw.Window.get().on 'new-win-policy', (frame, url, policy)->
    # do not open the window
    policy.ignore()
    # and open it in external browser
    nw.Shell.openExternal(url)
    return

  return


try
  analytics.initialize('UA-115166795-1')
catch err
  console.log "fail analytics.initialize. err:", err

analytics and analytics.pageview('/client/desktop')
analytics and analytics.event('client_desktop', 'launch')


