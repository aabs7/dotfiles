# Greet me Hello
Hello() {
	echo "Hi, $USER."
}

##  Convert video to gif file.
# Usage: video2gif video_file (scale) (fps)
# Example Usage: video2gif example.mp4 
# Example Usage: video2gif example.mp4 320 10 (This scales to 320 width with 10 frames per second)
# scale = 0 takes the scale from the video
video2gif() {
  ffmpeg -y -i "${1}" -vf fps=${3:-10},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
  ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
  rm "${1}.png"
}
