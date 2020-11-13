$(document).load(function() {
   var d = new Date();
   d.setDate(d.getDate()+7);

   $('#currentDate').datePick({dateFormat: 'dd-mm-yyyy', minDate: d});
   var date1 = $('#currentDate').val();
});