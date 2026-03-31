FROM alpine:3.23.3

RUN apk add --no-cache ffmpeg

EXPOSE 8080

CMD ["sh", "-c", "ffmpeg -rtsp_transport tcp \
    -i \"$RTSP_URL\" \
    -an \
    -c:v mjpeg \
    -q:v 5 \
    -f mpjpeg \
    -listen 1 \
    http://0.0.0.0:8080/stream.mjpg"]
