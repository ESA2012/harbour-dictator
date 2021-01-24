.import "Account.js" as Account

function view(main, DATA) {
    var res = DATA.stole()

    var onActionHandler = function() {
        Account.view(main, DATA);
    }

    var props = {
        swissBefore: res.swissBefore,
        treasuryBefore: res.treasuryBefore,
        stolen: res.stolen,
        swissAfter: res.swissAfter,
        treasuryAfter: res.treasuryAfter,
        onAction: onActionHandler
    }

    main.view("ViewSwissBankTransfer.qml", props);
}
