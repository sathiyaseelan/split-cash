var init_user_lookup = function(){

$('#user-lookup-form').on('ajax:before', function(event, data, status){
    show_spinner();
});

$('#user-lookup-form').on('ajax:complete', function(event, status){
  //hide_spinner();
});

$('#user-lookup-form').on('ajax:success', function(event, data, status){
    $('#lookup_container').html(data);
    hide_spinner();
});

$('#user-lookup-form').on('ajax:error', function(event, xhr, status, error){
    hide_spinner();
    $('#lookup_container').replaceWith('');
    $('#user-lookup-errors').show();
    $('#user-lookup-errors').html('user was not found.');
});

};

$(document).ready(function(){
   init_user_lookup();
});
