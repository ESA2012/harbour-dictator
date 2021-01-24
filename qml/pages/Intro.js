function view(main) {
    console.log("viewIntro");

    function onActionHandler() {
        main.nextStep();
    }

    main.view("ViewIntro.qml", { onAction: onActionHandler })
}
