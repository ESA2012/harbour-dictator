.import "Account.js" as Account

function view(main, DATA, data) {
    var aidResult = DATA.getForeignAid(data);

    var onActionHandler = function() {
        Account.view(main, DATA);
    }

    var props = {
        aidResult: aidResult,
        name: data.author.name,
        onAction: onActionHandler,
        decision: data
    }

    main.view("ViewAid.qml", props);
}
