const fs = require('fs');
const crypto = require('crypto');

function verifyLog(filePath) {
  const data = JSON.parse(fs.readFileSync(filePath));
    const expectedHash = crypto.createHash('sha256')
        .update(`${data.timestamp}|${data.source}|${data.command}`)
            .digest('hex');
            
              if (expectedHash === data.hash) {
                  console.log('✅ Audit verified: Integrity intact');
                    } else {
                        console.warn('⚠️ Audit failed: Hash mismatch');
                          }
                          }
                          
                          module.exports = { verifyLog };