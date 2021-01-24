function increase(a) {
    return a < 9 ? ++a : a;
}

function decrease(a) {
    return a > 9 ? --a : a;
}

function limit(a) {
    if (a < 0) return 0;
    if (a > 9) return 9;
    return a;
}

var Statuses = {
    DEFAULT: ':',
    ASSASINATION: 'a',
    REVOLUTION: 'r'
}

function buildGroup (id, popularity, strength, status, allies, name) {
    return {
        id: id,
        popularity: popularity, // Popularity 0-9
        strength: strength,     // Strenght 0-9
        status: status,         // Status
        allies: allies,         // Allies to revolute
        name: name              // Title
    }
}

function buildData (id, used, cost, monthly_cost, popularity, strength, author, reusable) {
    return {
        id: id,
        used: used,
        cost: cost,
        monthly_cost: monthly_cost,
        popularity: popularity,
        strength: strength,
        text: id,
        author: author,
        reusable: reusable
    }
}

function random(num) {
    return Math.ceil(Math.random() * 10000) % num;
}

function getAccountData(data) {
    return {
        treasury: data.treasury,
        monthlyCost: data.monthly_cost,
        swissBankAccount: data.swiss_bank_account,
    }
}

function delay(root, delayTime, callback) {
    function Timer() {
        return Qt.createQmlObject("import QtQuick 2.0; Timer {}", root);
    }
    var timer = new Timer();
    timer.interval = delayTime;
    timer.repeat = false;
    timer.triggered.connect(callback);
    timer.start();
}
