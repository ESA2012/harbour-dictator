function view(main, DATA, ddata) {
    console.log("viewAdvice");

    var props = {
        petition: ddata,
        advice: DATA.advice(ddata)
    }

    main.push("ViewAdvice.qml", props);
}
