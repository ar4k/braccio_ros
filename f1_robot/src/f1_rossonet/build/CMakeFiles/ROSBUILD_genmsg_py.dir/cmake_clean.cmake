FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/f1_rossonet/msg"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/f1_rossonet/msg/__init__.py"
  "../src/f1_rossonet/msg/_F1WriteServos.py"
  "../src/f1_rossonet/msg/_F1Servos.py"
  "../src/f1_rossonet/msg/_F1ReadServos.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
