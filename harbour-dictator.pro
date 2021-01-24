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
TARGET = harbour-dictator

DEFINES += APP_VERSION=\\\"$$VERSION\\\"

CONFIG += sailfishapp

QT += core

SOURCES += src/harbour-dictator.cpp \
    src/gameservice.cpp

DISTFILES += qml/harbour-dictator.qml \
    qml/cover/CoverPage.qml \
    qml/pages/Account.js \
    qml/pages/Advice.js \
    qml/pages/Aid.js \
    qml/pages/Assasination.js \
    qml/pages/Audience.js \
    qml/pages/Bankrupt.js \
    qml/pages/ButtonOk.qml \
    qml/pages/CashAdviceComponent.qml \
    qml/pages/Data.js \
    qml/pages/DataTextConstants.qml \
    qml/pages/Decision.js \
    qml/pages/Divider.qml \
    qml/pages/FillBackground.qml \
    qml/pages/FreeReport.js \
    qml/pages/GameOver.js \
    qml/pages/HeaderComponent.qml \
    qml/pages/Intro.js \
    qml/pages/KeyValue.qml \
    qml/pages/ListItemButton.qml \
    qml/pages/Month.js \
    qml/pages/News.js \
    qml/pages/PoliceReport.js \
    qml/pages/ProgressBarPlus.qml \
    qml/pages/Revolution.js \
    qml/pages/RevolutionStart.js \
    qml/pages/SwissBankTransfer.js \
    qml/pages/ViewAbout.qml \
    qml/pages/ViewAccount.qml \
    qml/pages/ViewAdvice.qml \
    qml/pages/ViewAid.qml \
    qml/pages/ViewAssasination.qml \
    qml/pages/ViewAudience.qml \
    qml/pages/ViewBankrupt.qml \
    qml/pages/ViewDecisionGroups.qml \
    qml/pages/ViewDecisionList.qml \
    qml/pages/ViewDecisionSelected.qml \
    qml/pages/ViewGameOver.qml \
    qml/pages/ViewIntro.qml \
    qml/pages/ViewMonth.qml \
    qml/pages/ViewNews.qml \
    qml/pages/ViewPoliceReport.qml \
    qml/pages/ViewReport.qml \
    qml/pages/ViewRevolution.qml \
    qml/pages/ViewRevolutionEnd.qml \
    qml/pages/ViewRevolutionNoEscape.qml \
    qml/pages/ViewRevolutionStart.qml \
    qml/pages/ViewRevolutionYouWin.qml \
    qml/pages/ViewSwissBankTransfer.qml \
    qml/pages/ViewWar.qml \
    qml/pages/ViewWarThreat.qml \
    qml/pages/ViewWelcome.qml \
    qml/pages/War.js \
    qml/pages/WarThreat.js \
    qml/pages/Welcome.js \
    qml/pages/jsDictator.js \
    qml/pages/utils.js \
    rpm/harbour-dictator.changes.in \
    rpm/harbour-dictator.changes.run.in \
    rpm/harbour-dictator.spec \
    rpm/harbour-dictator.yaml \
    translations/*.ts

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-dictator-de.ts \
                translations/harbour-dictator-ru.ts

RESOURCES += \
    resources.qrc

HEADERS += \
    src/gameservice.h

