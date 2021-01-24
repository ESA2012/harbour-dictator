.import "PoliceReport.js" as PoliceReport

// ------------------ Revolitionary lose ------------------
function viewLose(main, DATA) {
    var onActionHandler = function() {
        main.gameOver();
    }

    var props = {
        onAction: onActionHandler,
        revolutionResult: ["you", "overthrown", "and", "liquidated"]
    }

    main.view("ViewRevolutionEnd.qml", props);
}


// ------------------ Revolitionary lose ------------------
function viewWin(main, DATA) {
    var onActionHandler = function(payload) {
        if (payload.punish) {
            DATA.punish();
            PoliceReport.view(main, DATA);
        } else {
            main.nextStep();
        }
    }

    var props = {
        onAction: onActionHandler
    }
    main.view("ViewRevolutionYouWin.qml", props);
}


// ------------------ Revolution Start ------------------
function view(main, DATA) {

    var onActionHandler = function() {
        if (DATA.isRevolutionWins()) {
            viewLose(main, DATA);
        } else {
            viewWin(main, DATA);
        }
    }

    var props = {
        onAction: onActionHandler,
        revolutionaryStrenth: DATA.revolutionary_strenth,
        yourStrength: DATA.your_strength,
        allies: DATA.ALLIES,
    }

    main.view("ViewRevolutionStart.qml", props);
}
