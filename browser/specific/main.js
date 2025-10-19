#!/usr/bin/env node

import { execSync } from 'child_process';
import chalk from 'chalk';
import { loadConfig, logSession, triggerModule } from './lib/core.js';
import { modules } from './lib/modules.js';

// 🧠 Load branded config overlays
const config = loadConfig();
logSession('TraceForge-V1.1 initialized', config);

// 🧩 Parse CLI args
const args = process.argv.slice(2);
const command = args[0];
const

export const modules = ['identify', 'verify', 'restore', 'deploy', 'connect', 'manifest'];

