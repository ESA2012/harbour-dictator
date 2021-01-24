.import "utils.js" as Utils
.import "PoliceReport.js" as PoliceReport

function view(main, DATA) {
    var newsSelected = DATA.getNews();

    if (!newsSelected) {
        main.nextStep();
        return;
    }

    var onActionHandler = function() {
        DATA.transfer(newsSelected);
        DATA.plot();
        PoliceReport.view(main, DATA);
    }

    var props = {
        news: newsSelected,
        onAction: onActionHandler
    }

    main.view("ViewNews.qml", props);
}
