FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/f1_rossonet/msg"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/F1WriteServos.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_F1WriteServos.lisp"
  "../msg_gen/lisp/F1Servos.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_F1Servos.lisp"
  "../msg_gen/lisp/F1ReadServos.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_F1ReadServos.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
