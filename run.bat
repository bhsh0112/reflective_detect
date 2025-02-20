@echo off

call conda activate reflect
python detect.py --weights final.pt --source 0
pause >nul