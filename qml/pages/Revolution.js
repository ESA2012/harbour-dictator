.import "RevolutionStart.js" as RevolutionStart
.import "utils.js" as Utils

// ------------------ Revolution Escape ------------------
function viewRevolutionEnd(main, DATA) {
    var escapeResult = DATA.tryToEscape();

    var onActionHandler = function(){
        main.gameOver();
    }

    var props = {
        onAction: onActionHandler,
        revolutionResult: escapeResult
    }

    main.view("ViewRevolutionEnd.qml", props);
}

function viewRevolutionNoEscape(main, DATA) {

    var rev = DATA.calcRevolution();

    var onActionHandler = function(payload) {
        var result = DATA.increaseYourStrengthWithAllies(payload);
        if (result) {
            RevolutionStart.view(main, DATA);
        } else {
            payload.jokePanel.open = true;
            var cb = function() {
                payload.jokePanel.open = false;
                viewRevolutionEnd(main, DATA);
            }
            Utils.delay(payload.jokePanel, 2000, cb);
        }
    }

    var props = {
        rAllies: rev.rAllies,
        rGroup: rev.rGroup,
        revolutionaryStrenth: rev.revolutionaryStrenth,
        availableAllies: rev.availableAllies,
        onAction: onActionHandler
    }

    main.view("ViewRevolutionNoEscape.qml", props)
}


function view(main, DATA) {
    if (!DATA.isRevolution()) return main.nextStep();

    function onActionHandler(payload) {
        var tryEscape = payload.tryEscape;
        if (tryEscape) {
            viewRevolutionEnd(main, DATA);
        } else {
            viewRevolutionNoEscape(main, DATA);
        }
    }

    main.view("ViewRevolution.qml", { onAction: onActionHandler })
}
