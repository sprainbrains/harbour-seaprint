# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = ru.attah.seaprint

i18n.path = /usr/share/ru.attah.seaprint/translations
i18n.files = translations/ru.attah.seaprint-de.qm \
             translations/ru.attah.seaprint-zh_CN.qm \
             translations/ru.attah.seaprint-fr.qm \
             translations/ru.attah.seaprint-es.qm \
             translations/ru.attah.seaprint-nl.qm \
             translations/ru.attah.seaprint-pl.qm \
             translations/ru.attah.seaprint-ru.qm

INSTALLS += i18n

# automatic generation of the translation .qm files from .ts files
system(lrelease $$PWD/translations/*.ts)

CONFIG += sailfishapp
QT += svg dbus
PKGCONFIG += mlite5 libcurl glib-2.0
INCLUDEPATH += $$system(pkg-config --cflags-only-I poppler-glib | sed 's/-I//g')
LIBS += -lcurl -lglib-2.0 -lgobject-2.0 -ldl -lstdc++fs
QMAKE_CXXFLAGS += -std=c++17
DEFINES += MADNESS=1
DEFINES += PDF_CREATOR='\\"SeaPrint\ $$VERSION\\"'
DEFINES += SEAPRINT_VERSION='\\"$$VERSION\\"'

SOURCES += src/harbour-seaprint.cpp \
    src/dbusadaptorbase.cpp \
    src/freedesktopdbusadaptor.cpp \
    src/rangelistchecker.cpp \
    src/convertchecker.cpp \
    src/imageitem.cpp \
    src/ippdiscovery.cpp \
    src/ippmsg.cpp \
    src/ippprinter.cpp \
    src/mimer.cpp \
    ppm2pwg/lib/printparameters.cpp \
    ppm2pwg/lib/ppm2pwg.cpp \
    ppm2pwg/lib/pdf2printable.cpp \
    ppm2pwg/lib/baselinify.cpp \
    ppm2pwg/lib/curlrequester.cpp \
    ppm2pwg/bytestream/bytestream.cpp \
    src/overrider.cpp \
    src/printerworker.cpp \
    src/seaprintdbusadaptor.cpp \
    src/settings.cpp

DISTFILES += qml/ru.attah.seaprint.qml \
    qml/cover/CoverPage.qml \
    qml/components/*qml \
    qml/pages/*.qml \
    qml/pages/*.js \
    qml/pages/*svg \
    qml/pages/*png \
    rpm/ru.attah.seaprint.changes.in \
    rpm/ru.attah.seaprint.changes.run.in \
    rpm/ru.attah.seaprint.spec \
    translations/*.ts \
    ru.attah.seaprint.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/ru.attah.seaprint-de.ts \
                translations/ru.attah.seaprint-zh_CN.ts \
                translations/ru.attah.seaprint-fr.ts \
                translations/ru.attah.seaprint-es.ts \
                translations/ru.attah.seaprint-nl.ts \
                translations/ru.attah.seaprint-pl.ts \
                translations/ru.attah.seaprint-ru.ts

HEADERS += \
    src/dbusadaptorbase.h \
    src/freedesktopdbusadaptor.h \
    src/rangelistchecker.h \
    src/convertchecker.h \
    src/imageitem.h \
    src/ippdiscovery.h \
    src/ippmsg.h \
    src/ippprinter.h \
    src/mimer.h \
    ppm2pwg/lib/ppm2pwg.h \
    ppm2pwg/lib/pdf2printable.h \
    ppm2pwg/lib/baselinify.h \
    ppm2pwg/lib/madness.h \
    ppm2pwg/lib/printparameters.h \
    ppm2pwg/lib/PwgPgHdr.h \
    ppm2pwg/lib/PwgPgHdr.codable \
    ppm2pwg/lib/UrfPgHdr.h \
    ppm2pwg/lib/UrfPgHdr.codable \
    ppm2pwg/lib/curlrequester.h \
    ppm2pwg/lib/argget.h \
    ppm2pwg/bytestream/bytestream.h \
    ppm2pwg/bytestream/codable.h \
    ppm2pwg/bytestream/array.h \
    src/overrider.h \
    src/papersizes.h \
    src/printerworker.h \
    src/seaprintdbusadaptor.h \
    src/settings.h

INCLUDEPATH += ppm2pwg/lib \
               ppm2pwg/bytestream
