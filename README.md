// backend/routes/upload.js
const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const Project = require('../models/Project');
const PlanFile = require('../models/PlanFile');

const router = express.Router();

// Configure Multer storage (local disk for MVP)
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const uploadDir = path.join(__dirname, '../../uploads');
    if (!fs.existsSync(uploadDir)) fs.mkdirSync(uploadDir);
    cb(null, uploadDir);
  },
  filename: (req, file, cb) => {
    const uniqueName = `${Date.now()}-${file.originalname}`;
    cb(null, uniqueName);
  }
});
const upload = multer({ storage });

// POST /api/upload/:projectId
router.post('/:projectId', upload.single('planPdf'), async (req, res) => {
  try {
    const { projectId } = req.params;
    const project = await Project.findById(projectId);
    if (!project) return res.status(404).json({ error: 'Project not found' });

    const planFile = new PlanFile({
      projectId,
      originalFilename: req.file.originalname,
      pages: []  // will populate later
    });
    await planFile.save();

    project.planFiles.push(planFile._id);
    project.status = 'legend_defined';
    await project.save();

    res.json({ message: 'Upload successful', planFileId: planFile._id });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Server error during upload' });
  }
});

module.exports = router;
