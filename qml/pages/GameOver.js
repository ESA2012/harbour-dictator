
function lastFreeReport(main, data) {
    var props = {
        month: data.month,
        groups: data.GROUP,
        yourStrength: data.your_strength,
        revolutionStrength: data.revolution_strength,
        onAction: main.finish,
    }

    main.view("ViewReport.qml", props);
}

function view(main, DATA) {
    console.log("Game Over");

    var result = DATA.calculateResults();

    var onActionHandler = function() {
        lastFreeReport(main, DATA);
    }

    var props = {
        onAction: onActionHandler,
        month: result.month,
        alive: result.alive,
        total: result.total,
        swiss: result.swiss,
        popularity: result.popularity,
        history: result.history,
        isNewRecord: result.isNewRecord
    }

    main.view("ViewGameOver.qml", props);

    return result.isNewRecord;
}
