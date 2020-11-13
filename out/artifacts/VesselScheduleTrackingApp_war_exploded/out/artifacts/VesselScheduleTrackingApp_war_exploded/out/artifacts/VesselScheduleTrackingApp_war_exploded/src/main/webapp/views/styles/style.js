document.querySelector('#currentDate').load = function() {
    let date = document.querySelector('#currentDate').value;
    date.setDate(new Date().getDate() + 7);
};