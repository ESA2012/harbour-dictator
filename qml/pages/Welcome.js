function view(main, DATA) {
    console.log("viewWelcome");

    function onActionHandler() {
        main.nextStep();
    }

    main.view("ViewWelcome.qml", { onAction: onActionHandler, history: DATA.getHistory() })
}
