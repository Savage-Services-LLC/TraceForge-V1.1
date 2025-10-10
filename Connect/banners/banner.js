const fs = require('fs');
const path = require('path');

function showBanner(type) {
  const bannerPath = path.join(__dirname, `${type}.txt`);
    if (fs.existsSync(bannerPath)) {
        const banner = fs.readFileSync(bannerPath, 'utf8');
            console.log(banner);
              } else {
                  console.warn(`⚠️ No banner found for ${type}`);
                    }
                    }
                    
                    module.exports = { showBanner };