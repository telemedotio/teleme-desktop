// Generated by CoffeeScript 2.3.2
(function() {
  var EL_LABELDOWN, EL_LABELUP, EL_TITLE, LANGUAGE_CODE, STATE, URL_TO_TELEGRAM, URL_TO_TELEME_WEB, doFetch, fetchWithTimeout, logLineUp, main, notifyFailure, openupTeleme, reinstateNodes;

  STATE = 0;

  EL_TITLE = null;

  EL_LABELUP = null;

  EL_LABELDOWN = null;

  LANGUAGE_CODE = "en";

  reinstateNodes = function() {
    EL_TITLE = $('#ELTitle');
    EL_LABELUP = $('#ELLabelUp');
    EL_LABELDOWN = $('#ELLabelDown');
    EL_LABELUP.text(navigator.userAgent);
  };

  URL_TO_TELEME_WEB = `https://www.teleme.io/web?utm_source=teleme_desktop&utm_medium=referral&hl=${LANGUAGE_CODE}&r=${Date.now()}`;

  URL_TO_TELEGRAM = `https://telegram.org/js/telegram-widget.js?r=${Date.now()}`;

  fetchWithTimeout = function(url) {
    return Promise.race([
      fetch(url),
      new Promise(function(_,
      reject) {
        return setTimeout((function() {
          return reject(new Error('Timeout'));
        }),
      5998);
      })
    ]);
  };

  doFetch = function(url, callback) {
    fetchWithTimeout(URL_TO_TELEME_WEB).then(function(res) {
      if (!(res && res.status >= 200 && res.status < 400)) {
        throw new Error(`invalid http status ${res.status} from the server.`);
      }
      return res;
    }).then(function() {
      return callback();
    }).catch(function(err) {
      console.log(`ERROR _httpGetJson url ${url}. error:`, err);
      callback(err);
    });
  };

  openupTeleme = function() {
    var options;
    options = {
      "title": "TeleMe Desktop",
      "width": 1118,
      "height": 598,
      "min_width": 518,
      "min_height": 518
    };
    return nw.Window.open(URL_TO_TELEME_WEB, options, function(newWin) {
      window.close(true);
    });
  };

  logLineUp = function(msg) {
    return EL_LABELUP.text(String(msg || ''));
  };

  main = function() {
    reinstateNodes();
    logLineUp("connecting to the server...");
    doFetch(URL_TO_TELEME_WEB, function(err) {
      if (err != null) {
        logLineUp("Fail to connect to TeleMe server.");
        notifyFailure(`Fail to connect to TeleMe server. \nPlease check your network connection. \nError:${err}\nRetry connection?`);
        return;
      }
      logLineUp("connecting to Telegram Web Service...");
      doFetch(URL_TO_TELEGRAM, function(err) {
        if (err != null) {
          logLineUp("Fail to connect to Telegram Web Service.");
          notifyFailure(`Fail to connect to Telegram Web Service. \nPlease check your network connection. \nError:${err}\nRetry connection?`);
          return;
        }
        logLineUp("Staring up.");
        openupTeleme();
      });
    });
  };

  notifyFailure = function(msg) {
    if (confirm(msg)) {
      setTimeout(mian, 188);
    } else {
      App.quit();
    }
  };

  $(document).ready(main);

}).call(this);