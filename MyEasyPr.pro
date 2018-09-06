QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


RESOURCES += qml.qrc \
    ico.qrc \
    fonts.qrc
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += $$PWD/easyprsource/include

SOURCES += \
    main.cpp \
    getplatelicense.cpp \

HEADERS += \
    easyprsource/include/easypr/core/character.hpp \
    easyprsource/include/easypr/core/chars_identify.h \
    easyprsource/include/easypr/core/chars_recognise.h \
    easyprsource/include/easypr/core/chars_segment.h \
    easyprsource/include/easypr/core/core_func.h \
    easyprsource/include/easypr/core/feature.h \
    easyprsource/include/easypr/core/params.h \
    easyprsource/include/easypr/core/plate.hpp \
    easyprsource/include/easypr/core/plate_detect.h \
    easyprsource/include/easypr/core/plate_judge.h \
    easyprsource/include/easypr/core/plate_locate.h \
    easyprsource/include/easypr/core/plate_recognize.h \
    easyprsource/include/easypr/train/ann_train.h \
    easyprsource/include/easypr/train/annCh_train.h \
    easyprsource/include/easypr/train/create_data.h \
    easyprsource/include/easypr/train/svm_train.h \
    easyprsource/include/easypr/train/train.h \
    easyprsource/include/easypr/util/kv.h \
    easyprsource/include/easypr/util/program_options.h \
    easyprsource/include/easypr/util/switch.hpp \
    easyprsource/include/easypr/util/util.h \
    easyprsource/include/easypr/api.hpp \
    easyprsource/include/easypr/config.h \
    easyprsource/include/easypr/version.h \
    easyprsource/include/easypr.h \
    getplatelicense.h

INCLUDEPATH += /usr/local/opencv3.2.0/include \
               /usr/local/opencv3.2.0/opencv\
               /usr/local/opencv3.2.0/opencv2\

LIBS += -L$$PWD/easyprsource/lib -leasypr
LIBS += -L$$PWD/easyprsource/lib -lthirdparty
LIBS += /usr/local/opencv3.2.0/lib/libopencv*




