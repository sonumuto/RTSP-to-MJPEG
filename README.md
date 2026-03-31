# RTSP-to-MJPEG

A small Docker image I developed to convert RTSP camera streams into an MJPEG stream for OctoPrint, which requires MJPEG.

## Build

Use `docker buildx` to build the image:

```sh
docker buildx build -t rtsp-to-mjpeg .
```

## Run

Run the container with your RTSP URL and expose port 8080:

```sh
docker run -d \
  -p 8080:8080 \
  --restart unless-stopped \
  -e RTSP_URL="rtsp://user:pass@camera-host/stream" \
  rtsp-to-mjpeg
```

The MJPEG stream is available at `http://localhost:8080/stream.mjpg`.

### Tuning for low-power devices (Pi Zero)

Defaults are tuned for low CPU usage (5 FPS, 640px wide, MJPEG quality 7, single thread). You can adjust them:

```sh
docker run -d \
  -p 8080:8080 \
  --restart unless-stopped \
  -e RTSP_URL="rtsp://user:pass@camera-host/stream" \
  -e FPS=4 \
  -e WIDTH=480 \
  -e QUALITY=8 \
  -e THREADS=1 \
  rtsp-to-mjpeg
```
