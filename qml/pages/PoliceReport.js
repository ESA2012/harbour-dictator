.import "FreeReport.js" as FreeReport

function view(main, DATA) {

    var onActionHandler = function(payload) {
        if (payload.viewReport) {
            DATA.treasury -= 1;
            FreeReport.view(main, DATA)
        } else {
            main.nextStep();
        }
    }

    var ps = DATA.POLICE.strength;
    var pp = DATA.POLICE.popularity;

    var reportAvailable = (DATA.treasury > 0 && pp > DATA.minimal && ps > DATA.minimal);

    var props = {
        available: reportAvailable,
        treasury: DATA.treasury,
        popularity: pp,
        strength: ps,
        minimal: DATA.minimal,
        onAction: onActionHandler
    }

    main.view("ViewPoliceReport.qml", props);
}
