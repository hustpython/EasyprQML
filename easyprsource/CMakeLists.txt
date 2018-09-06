# 用来编译生成lib文件
cmake_minimum_required(VERSION 3.0.0)
project(easypr)
add_definitions(-std=c++11)
# c++11 required
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# OpenVC3 required
find_package(OpenCV  REQUIRED)

# where to find header files
include_directories(.)
include_directories(include)
include_directories(${OpenCV_INCLUDE_DIRS})

# sub directories
add_subdirectory(thirdparty)

# sources to be compiled
set(SOURCE_FILES
        src/core/core_func.cpp
        src/core/chars_identify.cpp
        src/core/chars_recognise.cpp
        src/core/chars_segment.cpp
        src/core/feature.cpp
        src/core/plate_detect.cpp
        src/core/plate_judge.cpp
        src/core/plate_locate.cpp
        src/core/plate_recognize.cpp
        src/core/params.cpp

        src/train/ann_train.cpp
        src/train/annCh_train.cpp
        src/train/svm_train.cpp
        src/train/train.cpp
        src/train/create_data.cpp

        src/util/util.cpp
        src/util/program_options.cpp
        src/util/kv.cpp
        )

# pack objects to static library
add_library(easypr STATIC ${SOURCE_FILES})
