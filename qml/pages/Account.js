.import "utils.js" as Utils

function view(main, DATA, from, to) {
    console.log("View Account");

    function onActionHandler() {
        main.nextStep();
    }

    var props = {
        from: from || Utils.getAccountData(DATA),
        to: to || Utils.getAccountData(DATA),
        onAction: onActionHandler,
    }

    main.view("ViewAccount.qml", props);
}
