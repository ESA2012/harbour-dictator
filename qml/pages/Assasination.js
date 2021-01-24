.import "utils.js" as Utils

function view(main, DATA) {
    var asat = DATA.isAssassinationAttempt();

    if (!asat.attempt) {
        main.nextStep()
        return;
    }

    var onActionHandler;

    if (DATA.getAssassinationResult()) {
        onActionHandler = function() {
            main.gameOver();
        }
    } else {
        onActionHandler = function() {
            main.nextStep();
        }
    }

    var props = {
        assasin: asat.assasin,
        alive: DATA.alive,
        onAction: onActionHandler
    }

    main.view("ViewAssasination.qml", props);
}
