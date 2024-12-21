pip install -r requirements.txt
MainDIR=$(pwd)
arg1=${1:-'0'}
cd "$MainDIR"
python detect.py --weights final.pt --source $arg1