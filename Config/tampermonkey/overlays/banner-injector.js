function injectBanner(type) {
  const banner = document.createElement('div');
    banner.className = 'traceforge-banner';
      banner.innerText = `TRACEFORGE CONNECT: ${type.toUpperCase()} ✅`;
        document.body.appendChild(banner);
        }