modprobe v4l2_common && python camera.py &
cd /data
python -m SimpleHTTPServer 80
