const { exec } = require('child_process');
const fs = require('fs');

function replay(filePath) {
  const data = JSON.parse(fs.readFileSync(filePath));
    console.log(`🔁 Replaying: ${data.command}`);
      exec(data.command, (err, stdout, stderr) => {
          if (err) console.error(`❌ Error: ${stderr}`);
              else console.log(`📤 Output:\n${stdout}`);
                });
                }
                
                module.exports = { replay };