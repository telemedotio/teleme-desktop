

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


doFetch = (url, callback)->
  fetch(URL_TO_TELEME_WEB)
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
    nw.Window.close()
    return

logLineUp = (msg)-> EL_LABELUP.text(String(msg || ''))

step0 = ->
  reinstateNodes()
  logLineUp "connecting to the server..."

  doFetch URL_TO_TELEME_WEB, (err)->
    if err?
      alert "Fail to connect to TeleMe server. \nPlease check your network connection. \nError:#{err}"
      return

    logLineUp "connecting to Telegram Web Service..."
    doFetch URL_TO_TELEGRAM, (err)->
      if err?
        alert "Fail to connect to Telegram Web Service. \nPlease check your network connection. \nError:#{err}"
        return

      logLineUp "Staring up."
      openupTeleme()
      return
    return
  return


$(document).ready step0






