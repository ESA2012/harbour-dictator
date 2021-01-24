.import "utils.js" as Utils
.import "Account.js" as Account
.import "Advice.js" as Advice
.import "Aid.js" as Aid
.import "SwissBankTransfer.js" as SwissBankTransfer


function viewSelectedDecision(main, DATA, decision) {
    function onActionHandler(payload) {
        var decisionResult = payload.adviceResult

        if (decisionResult === "advice") {

            var onAdviceActionHandler = function() {
                viewSelectedDecision(main, DATA, decision);
            }

            Advice.view(main, DATA, decision, onAdviceActionHandler);
            return;
        }

        if (decisionResult === 'refuse') {
            main.nextStep();
            return;
        }

        if (decisionResult === 'pass') {
            var r = decision.id;

            if (r === "d10") DATA.increaseYourStrength();

            if (r === "d12") {
                SwissBankTransfer.view(main, DATA);
                return;
            }

            if (r === "d13" || r === "d14") {
                Aid.view(main, DATA, decision);
                return;
            }

            var from = Utils.getAccountData(DATA);
            DATA.transfer(decision);
            var to = Utils.getAccountData(DATA);
            Account.view(main, DATA, from, to);
        }
    }

    var props = {
        decision: decision,
        treasury: DATA.treasury,
        usedRU: DATA.RUSSIAN_AID.used,
        usedUS: DATA.AMERICAN_AID.used,
        onAction: onActionHandler
    }

    main.push("ViewDecisionSelected.qml", props);
}



function viewDecisions(main, DATA, decisionsList) {

    var onActionHandler = function(payload) {
        var selectedDecision = payload.decision;
        if (selectedDecision) {
            viewSelectedDecision(main, DATA, selectedDecision);
        } else {
            main.nextStep();
        }
    }

    var props = {
        decisionsList: decisionsList,
        onAction: onActionHandler
    }

    main.push("ViewDecisionList.qml", props);
}



function view(main, DATA) {
    console.log("viewDecision");

    var onActionHandler = function(payload) {
        var d = payload.decision;
        var a;
        var start_end;

        switch (d) {
            case '1' : start_end = [0, 5]; break;
            case '2' : start_end = [6, 8]; break;
            case '3' : start_end = [9, 12]; break;
            case '4' : start_end = [13, 15]; break;
            case '5' : start_end = [16, 18]; break;
            default  : return main.nextStep();
        }

        var decisionsList = []

        for (a = start_end[0]; a <= start_end[1]; a++) {
            if (!DATA.DECISION[a].used) {
                decisionsList.push(DATA.DECISION[a]);
            }
        }

        viewDecisions(main, DATA, decisionsList);
    }

    main.view("ViewDecisionGroups.qml", { onAction: onActionHandler });
}
