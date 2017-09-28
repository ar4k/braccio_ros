FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/f1_rossonet/msg"
  "CMakeFiles/ROSBUILD_genmsg_cpp"
  "../msg_gen/cpp/include/f1_rossonet/F1WriteServos.h"
  "../msg_gen/cpp/include/f1_rossonet/F1Servos.h"
  "../msg_gen/cpp/include/f1_rossonet/F1ReadServos.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
