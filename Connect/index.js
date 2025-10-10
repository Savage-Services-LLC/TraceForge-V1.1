const { logEvent } = require('./audit/index');

function connectTampermonkey(cmd) {
  // ...bridge logic...
    logEvent({ source: 'Tampermonkey', command: cmd, status: 'success' });
    }