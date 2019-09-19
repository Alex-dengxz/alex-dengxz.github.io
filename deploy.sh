#!/bin/bash

hexo clean
hexo g
hexo d
git add .
git commit -m "Backup"
git push origin hexo