.import "Account.js" as Account
.import "Advice.js" as Advice
.import "utils.js" as Utils


function view(main, DATA) {
    console.log("viewAudience");

    var petition = DATA.audience();

    function onActionHandler(payload) {
        var audienceResult = payload.audienceResult;

        console.log(audienceResult)

        if (audienceResult === 'pass') {
            var from = Utils.getAccountData(DATA);
            DATA.transfer(petition);
            var to = Utils.getAccountData(DATA);
            Account.view(main, DATA, from, to);
        }

        if (audienceResult === 'refuse') {
            DATA.refuse(petition);
            Account.view(main, DATA);
        }

        if (audienceResult === 'advice') {
            var onActionHandler = function(payload) {
                view(main, DATA, petition)
            }
            Advice.view(main, DATA, petition);
        }
    }

    var props = {
        petition: petition,
        onAction: onActionHandler,
        treasury: DATA.treasury,
        usedRU: DATA.RUSSIAN_AID.used,
        usedUS: DATA.AMERICAN_AID.used
    }

    main.view("ViewAudience.qml", props);
}
