function view(main, data) {
    console.log("viewMonth");

    function onActionHandler() {
        main.nextStep();
    }

    var props = {
        month: data.month,
        onAction: onActionHandler,
    }

    main.view("ViewMonth.qml", props);
}
