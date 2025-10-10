const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const logDir = path.join(__dirname, 'logs');
if (!fs.existsSync(logDir)) fs.mkdirSync(logDir);

function logEvent({ source, command, status }) {
  const timestamp = new Date().toISOString();
    const hash = crypto.createHash('sha256').update(`${timestamp}|${source}|${command}`).digest('hex');
      const entry = { timestamp, source, command, status, hash };
      
        const logPath = path.join(logDir, `audit_${Date.now()}.json`);
          fs.writeFileSync(logPath, JSON.stringify(entry, null, 2));
            console.log(`🔐 Audit logged: ${logPath}`);
            }
            
            module.exports = { logEvent };