function view(main, data) {
    function onActionHandler() {
        main.nextStep();
    }

    var props = {
        month: data.month,
        groups: data.GROUP,
        yourStrength: data.your_strength,
        revolutionStrength: data.revolution_strength,
        onAction: onActionHandler
    }

    main.view("ViewReport.qml", props)
}
