function view(main, DATA) {
    console.log("viewWarThreat");

    var props = {
        onAction: main.nextStep
    }

    main.view("ViewWarThreat.qml", props)
}
