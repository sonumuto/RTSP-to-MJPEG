FROM alpine:3.23.3

RUN apk add --no-cache ffmpeg

EXPOSE 8080

ENV FPS=5 \
    WIDTH=640 \
    QUALITY=7 \
    THREADS=3

CMD ["sh", "-c", "ffmpeg -rtsp_transport tcp \
    -i \"$RTSP_URL\" \
    -an \
    -vf \"fps=$FPS,scale=$WIDTH:-1\" \
    -c:v mjpeg \
    -q:v $QUALITY \
    -threads $THREADS \
    -f mpjpeg \
    -listen 1 \
    http://0.0.0.0:8080/stream.mjpg"]
