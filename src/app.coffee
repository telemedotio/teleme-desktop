

STATE = 0

EL_TITLE = null
EL_SUB_TITLE = null
EL_LABELUP = null
EL_BTN_HELP = null

LANGUAGE_CODE = "en"

reinstateNodes = (callback)->
  EL_TITLE = $('#ELTitle')
  EL_SUB_TITLE = $('#ELSubtitle')
  EL_LABELUP =  $('#ELLabelUp')
  EL_BTN_HELP =  $('#ELHelpDesk')

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
  logLineUp "connecting to the server..."

  doFetch URL_TO_TELEME_WEB, (err)->
    if err?
      logLineUp "Fail to connect to TeleMe server."
      notifyFailure "Fail to connect to TeleMe server. \nPlease check your network connection. \nError:#{err}\nRetry connection?"
      return

    logLineUp "connecting to Telegram Web Service..."
    doFetch URL_TO_TELEGRAM, (err)->
      if err?
        logLineUp "Fail to connect to Telegram Web Service."
        notifyFailure "Fail to connect to Telegram Web Service. \nPlease check your network connection. \nError:#{err}\nRetry connection?"
        return

      logLineUp "Staring up."
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


