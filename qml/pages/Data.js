.pragma library

.import "utils.js" as Utils

// --------------------- Data section ---------------------

var GROUP = [
    Utils.buildGroup("g0", 7, 6, ' ', null, qsTr("Army")),
    Utils.buildGroup("g1", 7, 6, ' ', null, qsTr("Peasants")),
    Utils.buildGroup("g2", 7, 6, ' ', null, qsTr("Landowners")),
    Utils.buildGroup("g3", 0, 6, ' ', null, qsTr("Guerillas")),
    Utils.buildGroup("g4", 7, 6, ' ', null, qsTr("Leftotans")),
    Utils.buildGroup("g5", 7, 6, ' ', null, qsTr("Secret Police")),
    Utils.buildGroup("g6", 7, 0, ' ', null, qsTr("Russians")),
    Utils.buildGroup("g7", 7, 0, ' ', null, qsTr("Americans"))
];

var ARMY          = GROUP[0];
var PEASANTS      = GROUP[1];
var LANDOWNERS    = GROUP[2];
var GUERILLAS     = GROUP[3];
var LEFTOTANS     = GROUP[4];
var POLICE        = GROUP[5];
var RUSSIANS      = GROUP[6];
var AMERICANS     = GROUP[7];

var NULL_GROUP = { id: null };

var PETITION = [
    Utils.buildData("p0", false, "M", "H", "QJLMMMMM", "PKLMMM", ARMY, false),
    Utils.buildData("p1", false, "M", "M", "PMJMMMMM", "NMLMMM", ARMY, false),
    Utils.buildData("p2", false, "C", "M", "PLNMLMLM", "NMNIMM", ARMY, false),
    Utils.buildData("p3", false, "E", "M", "PLMMIMLM", "NMNKMM", ARMY, false),
    Utils.buildData("p4", false, "M", "M", "QONMMIMM", "NMNMMJ", ARMY, false),
    Utils.buildData("p5", false, "M", "M", "PMMMLMIO", "MMMMMM", ARMY, false),
    Utils.buildData("p6", false, "M", "D", "QMLMMMMM", "OLLLMM", ARMY, false),
    Utils.buildData("p7", false, "A", "M", "QLLMLLMM", "PLLKLM", ARMY, false ),
    Utils.buildData("p8", false, "M", "M", "LONMMMMM", "LMMLMM", PEASANTS, false),
    Utils.buildData("p9", false, "M", "M", "MQIMNMMM", "MOLMMM", PEASANTS, false),
    Utils.buildData("p10", false, "M", "P", "NQOMMIMM", "NNNNMJ", PEASANTS, false),
    Utils.buildData("p11", false, "M", "M", "MPKMKMMM", "MOKMMM", PEASANTS, false),
    Utils.buildData("p12", false, "C", "E", "LQKMOLNM", "MNLLMM", PEASANTS, false),
    Utils.buildData("p13", false, "M", "M", "MQJMNLNM", "MPJMML", PEASANTS, false),
    Utils.buildData("p14", false, "M", "M", "LQKMNLMM", "MOLLMM", PEASANTS, false),
    Utils.buildData("p15", false, "M", "S", "MPLMMMMM", "MMMLMM", PEASANTS, false),
    Utils.buildData("p16", false, "M", "M", "KMPMMMMM", "LMMMMM", LANDOWNERS, false),
    Utils.buildData("p17", false, "M", "M", "MIQMLMLM", "MKONMM", LANDOWNERS, false),
    Utils.buildData("p18", false, "W", "H", "MMPMNMOI", "MMNMMM", LANDOWNERS, false),
    Utils.buildData("p19", false, "M", "R", "MMPMJMLM", "MNOMLM", LANDOWNERS, false),
    Utils.buildData("p20", false, "M", "Q", "NNPMMIMM", "NMNNMK", LANDOWNERS, false),
    Utils.buildData("p21", false, "M", "H", "MMQMMMMM", "MMOMMM", LANDOWNERS, false),
    Utils.buildData("p22", false, "M", "M", "KLPMMMMM", "LLNNMM", LANDOWNERS, false),
    Utils.buildData("p23", false, "A", "C", "NNPMJMON", "MMPMKM", LANDOWNERS, false)
];

var NEWS = [
    Utils.buildData("n0", false, 'M', 'M', "MMMMMIMM", "MMMQMI", NULL_GROUP, false),
    Utils.buildData("n1", false, 'M', 'M', "MMMMMMMM", "LMMVMM", NULL_GROUP, false),
    Utils.buildData("n2", false, 'M', 'M', "MMMMMMMM", "IMMOMN", NULL_GROUP, false),
    Utils.buildData("n3", false, 'M', 'M', "MMMMMMMM", "MMJMKM", NULL_GROUP, false),
    Utils.buildData("n4", false, 'M', 'M', "MMMMMMMM", "MMOMIM", NULL_GROUP, false),
    Utils.buildData("n5", false, 'M', 'M', "MMMMMMMM", "MILKMM", NULL_GROUP, false),
];

var DECISION = [
    // 1. PLEASE a GROUP
    Utils.buildData("d0", false, 'M', 'M', "QLLMMLMM", "NMMLML", NULL_GROUP, false),
    Utils.buildData("d1", false, 'L', 'I', "LQNMOMNM", "MMMLMM", NULL_GROUP, false),
    Utils.buildData("d2", false, 'M', 'M', "LKQMMLLM", "LLOMML", NULL_GROUP, false),
    Utils.buildData("d3", false, 'R', 'M', "KMMMQMKN", "LMMLPM", NULL_GROUP, false),
    Utils.buildData("d4", false, 'Y', 'M', "MMLMLMKP", "MMMMMM", NULL_GROUP, false),
    Utils.buildData("d5", false, 'M', 'W', "KMMMMMPJ", "MMMMNM", NULL_GROUP, false),
    // 2. PLEASE ALL GROUPS
    Utils.buildData("d6", false, 'M', 'E', "NPPMMMMM", "LMMLMM", NULL_GROUP, false),
    Utils.buildData("d7", false, 'E', 'M', "PPPMMMMM", "MMMLMM", NULL_GROUP, false),
    Utils.buildData("d8", false, 'M', 'U', "PPPMMDMM", "ONNNMD", NULL_GROUP, false),
    // 3. IMPROVE your CHANCES
    Utils.buildData("d9", false, 'M', 'G', "JJJMMUMM", "LLLLMU", NULL_GROUP, false),
    Utils.buildData("d10", false, 'I', 'M', "KLLMMLMM", "KMMMML", NULL_GROUP, true),
    Utils.buildData("d11", false, 'A', 'M', "IIJMMKMM", "MMMMMM", NULL_GROUP, false),
    Utils.buildData("d12", false, 'M', 'M', "MMMMMMMM", "MMMMMM", NULL_GROUP, true),
    // 4.RAISE some CASH
    Utils.buildData("d13", false, 'M', 'M', "MMMMMMMM", "MMMMMM", RUSSIANS, true),
    Utils.buildData("d14", false, 'M', 'M', "MMMMMMMM", "MMMMMM", AMERICANS, true),
    Utils.buildData("d15", false, 'Z', 'M', "NNPMGMKM", "MMMMMM", NULL_GROUP, false),
    // 5.STRENGTHEN a GROUP
    Utils.buildData("d16", false, 'H', 'M', "PMMMJMLM", "RMMKKL", NULL_GROUP, false),
    Utils.buildData("d17", false, 'M', 'M', "MPLMMLMM", "MRLPML", NULL_GROUP, false),
    Utils.buildData("d18", false, 'M', 'M', "LLPMMLMM", "LLRLML", NULL_GROUP, false)
];

var HELICOPTER = DECISION[11];
var SWISS_BANK = DECISION[12];
var RUSSIAN_AID = DECISION[13];
var AMERICAN_AID = DECISION[14];

var treasury;
var monthly_cost;
var your_strength;
var swiss_bank_account;
var alive;
var month;
var plot_bonus;
var revolution_strength;
var minimal;

var history = 0;

// ----------------------- Functions ------------------------

function setHistory(h) {
    history = h;
}

function getHistory() {
    return history;
}

function restore() {
    console.log("Restored initial params");

    var i = 0;
    for (i = 0; i < PETITION.length; i++) {
        PETITION[i].used = false;
    }
    for (i = 0; i < NEWS.length; i++) {
        NEWS[i].used = false;
    }
    for (i = 0; i < DECISION.length; i++) {
        DECISION[i].used = false;
    }
    for (i = 0; i < GROUP.length; i++) {
        GROUP[i].popularity = 7;
        GROUP[i].strength = 6;
        GROUP[i].status = ' ';
        GROUP[i].allies = null;
    }

    GROUP[3].popularity = 0;
    GROUP[6].strength = 0;
    GROUP[7].strength = 0;

    treasury = 1000;
    monthly_cost = 60;
    your_strength = 4;
    swiss_bank_account = 0;
    alive = true;
    month = 0;
    plot_bonus = 0;
    revolution_strength = 10;
    minimal = 0;

    rGROUP = null;
    rALLIES = null;
    revolutionary_strenth = null;
    dictator_strength = null;
    ALLIES = null;
}



function nextMonth() {
    console.log("Random minimal popularity/strenght per turn");

    minimal = Utils.random(3) + 2;

    console.log(minimal)

    console.log("Random revolution strength per turn");
    revolution_strength = Utils.random(3) + 10;

    month = month + 1;

    console.log("Next month is " + month);
}



function reset_plot() {
    for (var a = 0; a < 3; a++) {
        GROUP[a].status = ' ';
        GROUP[a].allies = null;
    }
}



function plot() {
    console.log("Recount chances to assasination/revolution");

    SWISS_BANK.used = treasury <= 0;

    if (month < 3) return;

    reset_plot();

    if (month < plot_bonus) return;

    for (var a = 0; a < 3; a++) {
        if (GROUP[a].popularity > minimal) continue;
        for (var p = 0; p < 6; p++) {
            if (a === p || GROUP[p].popularity > minimal) continue;
            if (GROUP[a].strength + GROUP[p].strength >= revolution_strength) {
                GROUP[a].status = 'R';
                GROUP[a].allies = GROUP[p];
                break;
            }
        }
        if (GROUP[a].status === ' ') GROUP[a].status = 'A';
    }
}



function calcTreasury() {
    console.log("Calculate treasury");

    if (treasury > 0) {
        treasury -= monthly_cost;
        return true;
    }

    return false;
}



function bankrupt() {
    console.log("Calculate bankrupt");

    ARMY.poularity = Utils.decrease(ARMY.poularity);
    POLICE.poularity = Utils.decrease(POLICE.poularity);
    POLICE.strength = Utils.decrease(POLICE.strength);
    your_strength = Utils.decrease(your_strength);
    plot();
}



function audience() {
    console.log("Prepare petition for audience");
    var r = Utils.random(PETITION.length);
    var a = 0;
    for (a = 0; a < PETITION.length; a++) {
        if (!PETITION[r].used) break;
        if (r === PETITION.length - 1) {
            r = 0;
        } else {
            r++;
        }
        if (a === PETITION.length - 1) {
            for (a = 0; a < PETITION.length; a++) {
                PETITION[a].used = false;
            }
            a = 0;
        }
    }

    return PETITION[r];
}



function advice(data) {
    console.log("Ask for advice");

    var a;
    var result = [];
    for (a = 0; a < 8; a++) {
        if (data.popularity[a] !== 'M') {
            var r1 = data.popularity.charCodeAt(a) - 'M'.charCodeAt(0);
            result.push({ group: GROUP[a], value: r1, targetGroup: data.author.id === GROUP[a].id, type: 'p' });
        }
    }

    for (a = 0; a < 6; a++) {
        if (data.strength[a] !== 'M') {
            var r2 = data.strength.charCodeAt(a) - 'M'.charCodeAt(0);
            result.push({ group: GROUP[a], value: r2, targetGroup: data.author.id === GROUP[a].id, type: 's' });
        }
    }

    return result;
}



function refuse(data) {
    console.log("Refuce petition/decision");
    var a;
    for (a = 0; a < 3; a++) {
        if (data.author.id === GROUP[a].id) {
          GROUP[a].popularity -= (data.popularity.charCodeAt(a) - "M".charCodeAt(0));
          GROUP[a].popularity = Utils.limit(GROUP[a].popularity);
        }
    }
}



function transfer(data) {
    console.log("Calculate transfer");
    if (!data.reusable) {
        data.used = true;
    }

    var a;
    for (a = 0; a < 8; a++) {
        if (data.popularity[a] !== "M") {
            GROUP[a].popularity += data.popularity[a].charCodeAt(0) - "M".charCodeAt(0);
            GROUP[a].popularity = Utils.limit(GROUP[a].popularity);
        }
    }
    for (a = 0; a < 6; a++) {
        if (data.strength[a] !== "M") {
            GROUP[a].strength += data.strength[a].charCodeAt(0) - "M".charCodeAt(0);
            GROUP[a].strength = Utils.limit(GROUP[a].strength);
        }
    }

    treasury += 10 * (data.cost.charCodeAt(0) - "M".charCodeAt(0));
    monthly_cost -= data.monthly_cost.charCodeAt(0) - "M".charCodeAt(0);

    if (monthly_cost < 0) {
        monthly_cost = 0;
    }
}



function getForeignAid(data) {
    console.log("Ask for foreign aid");
    var rand = Utils.random(5);
    if (month <= rand + 3) return "too_early";
    if (data.used) return "no_more";
    if (data.author.popularity <= minimal) {
        if (data.author.id === "g6") return "no_rus";
        return "no_us";
    }
    data.used = true;
    var loan = data.author.popularity * 30 + Utils.random(200);
    treasury += loan;
    return loan;
}



function stole() {
    console.log("Stole money from trasury");

    var result = {
        swissBefore: swiss_bank_account,
        treasuryBefore: treasury
    }

    var stolen = Math.floor(treasury / 2);

    result.stolen = stolen;

    if (stolen > 0) {
        swiss_bank_account += stolen;
        treasury -= stolen;
    }

    result.swissAfter = swiss_bank_account;
    result.treasuryAfter = treasury;

    return result;
}



function increaseYourStrength() {
    console.log("Increase strenght");
    your_strength += 2;
}



function getNews() {
    console.log("Is there some news?");

    var rand = Utils.random(3);
    if (rand !== 0) return null;

    var r = Utils.random(NEWS.length);

    for (var a = 0; a < NEWS.length; a++) {
        if (!NEWS[r].used) break;
        r++;
        if (r === NEWS.length) r = 0;
        if (a === NEWS.length - 1) {
            return null;
        }
    }

    return NEWS[r];
}



function isAssassinationAttempt() {
    console.log("Calculate assassin");
    var rand = Utils.random(3);
    var ASSASSINS = GROUP[rand];
    return { attempt: ASSASSINS.status === "A", assasin: ASSASSINS };
}



function getAssassinationResult() {
    console.log("Calculate assassination result");

    var unluck = Utils.random(2);

    if ((ARMY.status === "A" && PEASANTS.status === "A" && LANDOWNERS.status === "A")
            || (POLICE.popularity <= minimal || POLICE.strength <= minimal)
            || unluck) {
        alive = false;
        return true;
    }
    return false;
}



function warThreatIncreasePopularity() {
    console.log("War theat");

    ARMY.popularity = Utils.increase(ARMY.popularity);
    PEASANTS.popularity = Utils.increase(PEASANTS.popularity);
    LANDOWNERS.popularity = Utils.increase(LANDOWNERS.popularity);
    POLICE.popularity = Utils.increase(POLICE.popularity);
}



function warResult() {
    console.log("Calculate war results");

    var a;
    var ritumban_strength = 0;
    var leftotan_strength = 0;

    ritumban_strength += your_strength;

    for (a = 0; a < 3; a++) {
        if (GROUP[a].popularity > minimal) {
            ritumban_strength += GROUP[a].strength;
        }
    }

    if (POLICE.popularity > minimal) {
        ritumban_strength += POLICE.strength;
    }

    for (a = 0; a < 6; a++) {
        if (GROUP[a].popularity <= minimal) {
            leftotan_strength += GROUP[a].strength;
        }
    }

    var rand = Utils.random(3);

    var result = [];

    if (ritumban_strength > leftotan_strength + rand) {
        LEFTOTANS.strength = 0;
        result.push("win");
    } else {
        result.push("lose")

        rand = Utils.random(3);

        var heli_used = HELICOPTER.used && rand;

        if (heli_used) {
            result.push("escaped");
        } else {
            result.push("executed");
            alive = 0;
        }
    }
    return { ritumbanStrength: ritumban_strength, leftotanStrength: leftotan_strength, warResult: result };
}


var rGROUP;
var rALLIES;
var revolutionary_strenth;
var dictator_strength;
var ALLIES;


function isRevolution() {
    console.log("Calculate chance for revolution");

    var a;
    for(a = 0; a < 3; a++) {
        var rand = Utils.random(3);
        rGROUP = GROUP[rand];
        if (rGROUP.status === "R") break;
        if (a === 2) return false;
    }
    rALLIES = rGROUP.allies;
    return true;
}



function tryToEscape() {
    console.log("Try to escape");

    var escapeResult = [];

    if (HELICOPTER.used) {
        var rand = Utils.random(3);
        if (rand) {
            escapeResult.push("helicopter_escape");
            return escapeResult;
        } else {
            escapeResult.push("helicopter_broke");
        }
    }
    escapeResult.push("leftoto_escape");

    rand = Utils.random(Math.floor(GUERILLAS.strength / 3) + 2);

    if (rand) {
        escapeResult.push("guerillas_catch");
        alive = false;
    } else {
        escapeResult.push("guerillas_no_catch");
    }

    return escapeResult;
}



function calcRevolution() {
    console.log("Prepare revolution");

    revolutionary_strenth = rGROUP.strength + (rALLIES ? rALLIES.strength : 0);
    dictator_strength = your_strength;

    var a;
    var h;

    var availableAllies = [];

    for (a = 0; a < 6; a++) {
        var ag = GROUP[a];
        if (ag.popularity <= minimal) continue;
        availableAllies.push(ag);
    }

    return {
        rAllies: rALLIES,
        rGroup: rGROUP,
        revolutionaryStrenth: revolutionary_strenth,
        availableAllies: availableAllies
    }
}



function increaseYourStrengthWithAllies(payload) {
    console.log("Collaborate with another group to confront revolution");
    ALLIES = payload.allies;
    if (ALLIES && ALLIES.popularity <= minimal) return false;
    dictator_strength += ALLIES ? ALLIES.strength : 0;
    return true;
}



function isRevolutionWins() {
    console.log("Calculate revolution results");
    var rand = Utils.random(3);
    var lose = revolutionary_strenth > dictator_strength + rand - 1;
    if (lose) {
        alive = false;
    }
    return lose;
}



function punish() {
    console.log("Punish the revolutionaries");

    rGROUP.strength = 0;
    rGROUP.popularity = 0;
    if (rALLIES) {
        rALLIES.popularity = 0;
        rALLIES.strength = 0;
    }
    if (ALLIES) {
        ALLIES.popularity = 9;
    }
    plot_bonus = month + 2;
    reset_plot();
}



function calculateResults() {
    console.log("Calculate final results");

    var total = 0;
    var totalPopularity = 0;

    for (var a = 0; a < 8; a++) {
      totalPopularity += GROUP[a].popularity;
    }

    total += totalPopularity;
    total += month * 3;

    if (alive) {
        total += 10;
        total += Math.floor(swiss_bank_account / 10);
    }


    var isNewRecord = false;

    if (total > history) {
        history = total;
        isNewRecord = true;
    }

    return {
        total: total,
        month: month,
        alive: Boolean(alive),
        swiss: swiss_bank_account,
        popularity: totalPopularity,
        history: history,
        isNewRecord: isNewRecord
    }
}
