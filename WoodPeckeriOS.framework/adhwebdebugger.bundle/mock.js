
function adhPageInit() {
  if(window.originConsole) {
    return;
  }
  window.originConsole = {};
}

adhPageInit();


function mockedMethodList () {
    const methodList = ['log', 'info', 'warn', 'debug', 'error'];
    return methodList;
}

//mock console methods
function mockConsole() {
  var methodList = mockedMethodList();
  window.console = {};
  if(!window.console) {
    window.console = {};
  }else {
    //save origin method
    methodList.map(function (method) {
      window.originConsole[method] = window.console[method];
    });
  }

  methodList.map(method => {
    window.console[method] = (...args) => {
      printLog({
        logType: method,
        logs: args
      });
    };
  });
}

function mockWindowError() {
  if(window.onerror) {
      window.originOnError = window.onerror;
  }
  window.onerror = printError;
}

function restoreWindowError() {
  window.onerror = window.originOnError;
}

/** 
 * @param {String} errorMessage
 * @param {String} scriptURI
 * @param {Long}  lineNumber
 * @param {Long}  columnNumber
 * @param {Object} errorObj 

 * @note WKWebView not work well
 */
function printError(errorMessage, scriptURI, lineNumber,columnNumber) { 
  var content = '';
  content += 'message: ' + errorMessage + '<br/>';
  content += 'scriptURI: ' + scriptURI + '<br/>';
  content += 'line: ' + lineNumber + '<br/>';
  content += 'column: ' + columnNumber;
  console.error(content);
}

//restore console methods
function restoreConsole() {
  var methodList = mockedMethodList();
  methodList.map(function (method) {
    window.console[method] = window.originConsole[method];
  });
}

//mocked log
function printLog(item) {
  var logType = item['logType'];

  let logs = item.logs || [];
  if (!logs.length) {
    return;
  }
  var content = '';
  for (let i = 0; i < logs.length; i++) {
      var value = logs[i];
      if(typeof(value) == 'object'){
        if(logs.length == 1) {
          result = JSON.stringify(value,null,4);
        }else {
          result = JSON.stringify(value,null);
        }
      }else {
        result = value.toString();
      }
      content += result;
  }
  var data = {};
  data['logType'] = logType;
  data['content'] = content;
  // data['date'] = new Date().toString();
  //webkit
  if(window.webkit) {
      if(window.webkit.messageHandlers.wkwebviewjsHandler) {
          window.webkit.messageHandlers.wkwebviewjsHandler.postMessage(data);
      }
  }
  //uiwebview
  if(window.webviewjsHandler) {
    webviewjsHandler(data);
  }
}


mockConsole();
mockWindowError();






