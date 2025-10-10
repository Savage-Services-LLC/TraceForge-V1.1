function logAudit(event) {
  const timestamp = new Date().toISOString();
    const entry = { source: "Tampermonkey", event, timestamp };
      localStorage.setItem(`traceforge_audit_${Date.now()}`, JSON.stringify(entry));
      }