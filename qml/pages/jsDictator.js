.pragma library

.import "Intro.js" as Intro
.import "Data.js" as Data
.import "Account.js" as Account
.import "FreeReport.js" as FreeReport
.import "Welcome.js" as Welcome
.import "Month.js" as Month
.import "Bankrupt.js" as Bankrupt
.import "Audience.js" as Audience
.import "PoliceReport.js" as PoliceReport
.import "Assasination.js" as Assasination
.import "War.js" as War
.import "Decision.js" as Decision
.import "News.js" as News
.import "Revolution.js" as Revolution
.import "GameOver.js" as GameOver

var LOADER = null;
var PAGE_STACK = null;
var NEXT_STEP = 0;

var GAME_SERVICE = null;

function initialize(pageStack, gameService) {
    console.log("Initialize")
    PAGE_STACK = pageStack;
    GAME_SERVICE = gameService;

    var prevHistory = GAME_SERVICE.loadHistory();

    NEXT_STEP = 0;
    Data.setHistory(prevHistory);
}

function view(name, props) {
    PAGE_STACK.replaceAbove(null, Qt.resolvedUrl(name), props);
}

function push(name, props) {
    PAGE_STACK.push(Qt.resolvedUrl(name), props);
}



var GAME_STEPS = [
    Data.restore,
    Welcome,
    Account,
    FreeReport,
    Data.nextMonth,
    Month,
    Data.plot,
    Bankrupt,
    Audience,
    Data.plot,
    Assasination,
    War,
    Data.plot,
    PoliceReport,
    Decision,
    PoliceReport,
    News,
    Revolution
]

function nextStep() {
    console.log("---> Step: " + NEXT_STEP + " <---");
    var stepFn = GAME_STEPS[NEXT_STEP++];
    if (stepFn) {
        if (stepFn.view  && typeof stepFn.view === "function") {
            stepFn.view(this, Data)
        }
        if (typeof stepFn === "function") {
            stepFn();
            nextStep();
        }
    } else {
        NEXT_STEP = 4; // Next month
        nextStep();
    }
}

function gameOver() {
    var isNewRecord = GameOver.view(this, Data);
    if (isNewRecord) {
        var newHistory = Data.getHistory();
        GAME_SERVICE.saveHistory(newHistory);
    }
}

function finish() {
    NEXT_STEP = 0;
    view("ViewIntro.qml", { onAction: nextStep })
}
