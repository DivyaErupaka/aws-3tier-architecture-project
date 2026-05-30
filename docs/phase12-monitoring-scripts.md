# 📊 Phase 12: Monitoring & Health Check Scripts

## 🎯 Objective
Implement a monitoring script to track system health including CPU, memory, disk usage, and service status for Tomcat and MySQL.

---

## 🧱 Server Used
- Tomcat Server
- Database Server (optional extension)

---

## 📝 Step 1: Create Monitoring Script

```bash
vi health-check.sh
Step 3: Make Script Executable
chmod +x health-check.sh

📸 Screenshot:
screenshots/phase12/script-permission.png

🚀 Step 4: Run Script
./health-check.sh

📸 Screenshot:
screenshots/phase12/script-output.png

⏰ Step 5: (Optional) Schedule Monitoring via Cron
crontab -e

Add:

*/10 * * * * /home/ec2-user/health-check.sh >> /home/ec2-user/health.log

👉 Runs every 10 minutes

📄 Step 6: Verify Logs (Optional)
cat health.log
