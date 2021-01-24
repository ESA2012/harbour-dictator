.import "utils.js" as Utils
.import "WarThreat.js" as WarThreat

function view(main, DATA) {
    if (DATA.LEFTOTANS.popularity > DATA.minimal || DATA.LEFTOTANS.strength < DATA.minimal) {
        main.nextStep();
        return;
    }

    var rand = Utils.random(3);

    if (rand) {
        DATA.warThreatIncreasePopularity();
        WarThreat.view(main);
        return;
    }

    console.log("viewWar");

    var result = DATA.warResult();

    var onActionHandler = function() {
        if (result.warResult[0] === "win") {
            main.nextStep();
        } else {
            main.gameOver();
        }
    }

    var props = {
        ritumbanStrength: result.ritumbanStrength,
        leftotanStrength: result.leftotanStrength,
        warResult: result.warResult,
        onAction: onActionHandler
    }

    main.view("ViewWar.qml", props);
}
