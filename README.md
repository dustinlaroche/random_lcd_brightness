# Random LCD Brightness
This script will run on Ubuntu, and will randomly change the LCD brightness. 

Different laptops use different backlight interfaces. Check yours:

```
ls /sys/class/backlight/
```

Common values:
  * intel_backlight
  * acpi_video0
  * amdgpu_bl0
  * nvidia_backlight

Update the script’s BRIGHTNESS_PATH and MAX_PATH accordingly.
