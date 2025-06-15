#!/bin/bash
set -e

# Create folder structure
mkdir -p backend/routes backend/models backend/controllers \
         frontend/public frontend/src/components frontend/src/services

# Backend files
cat > backend/server.js << 'EOD'


3. **Run the script**:
```bash
chmod +x scaffold.sh
./scaffold.sh

ls
# you should see backend/  frontend/  .gitignore  README.md  scaffold.sh

git add .
git commit -m "Add Day 1 scaffold"
git push origin day1-scaffold

# 1. Create and switch to the branch
git checkout -b day1-scaffold

# 2. Make the folder structure
mkdir -p backend/routes backend/models backend/controllers
mkdir -p frontend/public frontend/src/components frontend/src/services

# 3. Create all the stub files
touch backend/server.js backend/package.json backend/.env
touch backend/routes/upload.js
touch backend/models/Project.js backend/models/LegendItem.js backend/models/PlanFile.js backend/models/Detection.js
touch backend/controllers/detectController.js

touch frontend/package.json frontend/public/index.html
touch frontend/src/App.js frontend/src/index.js
touch frontend/src/components/UploadForm.jsx frontend/src/components/LegendManager.jsx frontend/src/components/DetectScreen.jsx frontend/src/components/ResultsTable.jsx
touch frontend/src/services/api.js

touch .gitignore README.md

# 4. Commit & push
git add .
git commit -m "Add Day 1 scaffold"
git push origin day1-scaffold
cd ~/TakeOffAI
pwd

Ctrl + C

Ctrl + C

Ctrl + C

Ctrl + C

rm scaffold.sh

