.import "utils.js" as Utils

function view(main, DATA) {
    var not_bankrupt = DATA.calcTreasury();

    console.log("viewBankrupt: " + !not_bankrupt);

    if (not_bankrupt) return main.nextStep();

    DATA.bankrupt();

    function onActionHandler() {
        main.nextStep();
    }

    main.view("ViewBankrupt.qml", { onAction: onActionHandler })
}
