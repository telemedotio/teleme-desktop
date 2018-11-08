

STATE = 0

EL_TITLE = null
EL_LABELUP = null
EL_LABELDOWN = null

LANGUAGE_CODE = "en"

reinstateNodes = ->
  EL_TITLE = $('#ELTitle')
  EL_LABELUP =  $('#ELLabelUp')
  EL_LABELDOWN =  $('#ELLabelDown')

  EL_LABELUP.text(navigator.userAgent)
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
    "height": 598,
    "min_width" : 518,
    "min_height" : 518,

  nw.Window.open URL_TO_TELEME_WEB, options, (newWin)->
    newWin.on 'new-win-policy', (frame, url, policy)->
      # do not open the window
      policy.ignore()
      # and open it in external browser
      nw.Shell.openExternal(url)
      return

    window.close(true)
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
  if confirm(msg)
    setTimeout(mian, 188)
  else
    #App.quit()
    window.close(true)
  return

$(document).ready ->
  reinstateNodes()
  main()

  nw.Window.get().on 'new-win-policy', (frame, url, policy)->
    # do not open the window
    policy.ignore()
    # and open it in external browser
    nw.Shell.openExternal(url)
    return

  return



