// ==UserScript==
// @name         TraceForge Bridge
// @match        *://*/*
// @grant        GM_xmlhttpRequest
// ==/UserScript==

GM_xmlhttpRequest({
  method: "POST",
    url: "http://localhost:5000/run",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
        data: "cmd=traceforge identify --input board.jpg",
          onload: function(response) {
              console.log("TraceForge output:", response.responseText);
                }
                });