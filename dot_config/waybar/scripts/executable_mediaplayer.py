#!/usr/bin/env python3
import json
import subprocess
def get_media_info():
    try:
        status = subprocess.check_output(["playerctl", "status"], text=True).strip()
        if status == "Stopped":
            return json.dumps({"text": "", "class": "stopped", "tooltip": "No media playing"})
        artist = subprocess.check_output(["playerctl", "metadata", "artist"], text=True).strip()
        title = subprocess.check_output(["playerctl", "metadata", "title"], text=True).strip()
        if len(title) > 30:
            title = title[:27] + "..."
        if status == "Playing":
            output = f" {artist} - {title}"
        else:
            output = f" {artist} - {title}"
        return json.dumps({"text": output, "class": "playing" if status=="Playing" else "paused", "tooltip": f"{artist} - {title}"})
    except:
        return json.dumps({"text": "󰎈 No player", "class": "none", "tooltip": "No active media player"})
if __name__ == "__main__":
    print(get_media_info())
