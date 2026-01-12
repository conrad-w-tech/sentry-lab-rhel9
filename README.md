# 🚀 Sentry Self-Hosted: The RHEL 9 Lab

This isn't just another "click-install" tutorial. This repo documents my journey of setting up a production-grade Sentry instance on **RHEL 9**, dealing with real-world infrastructure hurdles, and automating the boring stuff.

## 🛠 The Tech Stack
* **OS:** RHEL 9 (The stable beast)
* **Engine:** Native Docker (Because sometimes "native" beats "emulated")
* **App:** Sentry Self-Hosted (30+ containers of pure monitoring power)
* **Automation:** Bash + Cron + Sentry Cron Monitors

## 🧠 The Story (and why I pivoted)
I started with **Podman**, trying to be a RHEL purist. But Sentry's installation scripts and Podman's emulation layer didn't see eye-to-eye (classic architecture detection issues). 

**The Fix:** I made the call to switch to **Native Docker Engine**. Result? 100% stability and zero "shadow" errors. 

## 🏗 Infrastructure "Proper" Way
Instead of dumping everything in my home folder, I followed the **FHS standards**:
* `/opt/sentry` - Where the magic (app) lives.
* `/var/backups/sentry` - Where the safety net (backups) stays.
* **Security:** Everything is handled by a dedicated `sentry-svc` service account. No root, no mess.

## 💾 Reliability (Backups)
I've automated the Postgres and config backups. To make it "DevOps-y", I integrated **Sentry Cron Monitoring**. If the backup script fails or doesn't run, Sentry screams at me. 

### How to use my backup script:
1. Move it to `/opt/sentry/scripts/`
2. Set up your DSN in the variables.
3. Add to crontab: `0 3 * * * /usr/bin/bash /opt/sentry/scripts/backup-sentry.sh`

---